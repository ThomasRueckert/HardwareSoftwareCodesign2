/*
 * Blinker.c
 */

#include "xparameters.h"	/* Hardwareparameter */

#include "xgpio.h"		/* Interface fuer GPIO-Komponente, wir fuer LEDs benoetigt */
#include "xintc.h"		/* Interface fuer Interruptcontroller */
#include "xexception_l.h"	/* Interface fuer PowerPC Exceptions und Interrupts */
#include "xtmrctr_l.h"		/* Interface fuer Timer */
#include "xuartlite_l.h"	/* Interface fuer serielle Schnittstelle */

#define LED_MSB 0x00000080	/* mask for position of left-most LED */

/* Global variables */
unsigned int led_data = 0;		/* initial LED pattern when interrupt test begins */
unsigned int timer_count = 33554432;	/* initial timer period in XPS cycles ~= 0.3 sec */
volatile unsigned int exit_command = 0;	/* flag from UART ISR to exit InterruptTest routine */

XIntc	interrupt_controller;

/* UART interrupt service routine */
void uart_int_handler(void *baseaddr_p) {
	char c;
	/* While UART receive FIFO has data */
	while (!XUartLite_mIsReceiveEmpty(XPAR_RS232_UART_BASEADDR)) {
		/* Read a character */
		c = XUartLite_RecvByte(XPAR_RS232_UART_BASEADDR);
		switch (c) {
			case 'f': /* FASTER command */
				if (timer_count > 1) {
					timer_count >>= 1;
					print("-- Halbiere Timerperiode. --\r\n");
				}
				break;
			case 's': /* SLOWER command */
				if (timer_count < 1073741824) {
					timer_count <<= 1;
					print("-- Verdopple Timerperiode. --\r\n");
				}
				break;
			case 'x': /* EXIT command */
				exit_command = 1;
		}
		/* Update timer period with new value of timer_count */
		XTmrCtr_mSetLoadReg(XPAR_XPS_TIMER_1_BASEADDR, 0, timer_count);
	}
}

/* Timer interrupt service routine */
void timer_int_handler(void * baseaddr_p) {
	unsigned int csr;
	/* Read timer 0 CSR to see if it requested the interrupt */
	csr = XTmrCtr_mGetControlStatusReg(XPAR_XPS_TIMER_1_BASEADDR, 0);
	if (csr & XTC_CSR_INT_OCCURED_MASK) {
		/* Increment led_count in a johnson-counter pattern */
		if (led_data & LED_MSB)
			led_data = led_data << 1;
		else
			led_data = (led_data << 1) + 1;
		/* Update LED output pattern */
		XGpio_mSetDataReg(XPAR_LEDS_8BIT_BASEADDR, 1, led_data);
	}
	/* Clear the timer interrupt */
	XTmrCtr_mSetControlStatusReg(XPAR_XPS_TIMER_1_BASEADDR, 0, csr);
}

/* Routine to write a pattern out to a GPIO
 * which is configured as an output
 * PARAMETER C_ALL_INPUTS = 0 */ 
void WriteToGPOutput(Xuint32 BaseAddress, int gpio_width) {
	int i=0, j=0, k=0;
	int numTimes = 5;

	XGpio_mSetDataDirection(BaseAddress, 1, 0x00000000);   /* Set as outputs */
	while (numTimes > 0) {
		j = 1;
		for (i=0; i<(gpio_width-1); i++) {
			XGpio_mSetDataReg(BaseAddress, 1, j);
			j = j << 1;
			for (k=0; k<1000000; k++) {
				; // wait
			}
		}
		j = 1;
		j = ~j;
		for (i=0; i<(gpio_width-1); i++) {
			XGpio_mSetDataReg(BaseAddress, 1, j);
			j = j << 1;
			for (k=0; k<1000000; k++) {
				; // wait
			}
		}
		numTimes--;
	}
}

/* System initialisieren */
void Setup(void) {
	print("Aktiviere Interrupts ...\r\n");

	/* Interruptcontroller initialisieren */
	XIntc_Initialize(
			&interrupt_controller,
			XPAR_XPS_INTC_0_DEVICE_ID );

	/* UART-Interrupthandler registrieren */
	XIntc_Connect(
			&interrupt_controller,
			XPAR_XPS_INTC_0_RS232_UART_INTERRUPT_INTR,
			(XInterruptHandler)uart_int_handler,
			(void *)XPAR_RS232_UART_BASEADDR );

	/* Timer-Interrupthandler registrieren */
	XIntc_Connect(
			&interrupt_controller,
			XPAR_XPS_INTC_0_XPS_TIMER_1_INTERRUPT_INTR,
			(XInterruptHandler)timer_int_handler,
			(void *)XPAR_XPS_TIMER_1_BASEADDR );

	/* Interruptcontroller starten */
	XIntc_Start(
			&interrupt_controller,
			XIN_REAL_MODE );

	/* Interrupts einschalten */
	XIntc_Enable(&interrupt_controller, XPAR_XPS_INTC_0_RS232_UART_INTERRUPT_INTR);
	XIntc_Enable(&interrupt_controller, XPAR_XPS_INTC_0_XPS_TIMER_1_INTERRUPT_INTR);

	/* Exceptionhandling des PowerPC initialisieren */
	XExc_Init();

	/* Interrupthandler des Interruptcontrollers beim Prozessor registrieren. */
	XExc_RegisterHandler(
			XEXC_ID_NON_CRITICAL_INT,
			(XExceptionHandler)XIntc_DeviceInterruptHandler,
			(void *)XPAR_XPS_INTC_0_DEVICE_ID );


	print("Aktiviere LEDs ...\r\n");
	/* Set the gpio for LEDs as output */
	XGpio_mSetDataDirection(XPAR_LEDS_8BIT_BASEADDR, 1, 0x00000000);

	print("Starte Timer ...\r\n");
	/* Set the number of cycles the timer counts before interrupting */
	XTmrCtr_mSetLoadReg(XPAR_XPS_TIMER_1_BASEADDR, 0, timer_count);
	
	/* Reset the timers, and clear interrupts */
	XTmrCtr_mSetControlStatusReg(XPAR_XPS_TIMER_1_BASEADDR, 0,
			XTC_CSR_INT_OCCURED_MASK | XTC_CSR_LOAD_MASK );
	
	/* Start the timers */
	XTmrCtr_mSetControlStatusReg(XPAR_XPS_TIMER_1_BASEADDR, 0,
			XTC_CSR_ENABLE_TMR_MASK | XTC_CSR_ENABLE_INT_MASK |
			XTC_CSR_AUTO_RELOAD_MASK | XTC_CSR_DOWN_COUNT_MASK);

	/* Enable PPC non-critical interrupts */
	XExc_mEnableExceptions(XEXC_NON_CRITICAL);
	
	/* Enable UART interrupts */
	XUartLite_mEnableIntr(XPAR_RS232_UART_BASEADDR);
}

int main (void) {

	print("-- Entering main() --\r\n");

	WriteToGPOutput(XPAR_LEDS_8BIT_BASEADDR, 8);

	Setup();

	while (!exit_command)
		; /* warten */

	/* Interrupts im Prozessor wieder deaktivieren */
	XExc_mDisableExceptions(XEXC_NON_CRITICAL);

	print("-- Exiting main() --\r\n");
	return 0;
}

