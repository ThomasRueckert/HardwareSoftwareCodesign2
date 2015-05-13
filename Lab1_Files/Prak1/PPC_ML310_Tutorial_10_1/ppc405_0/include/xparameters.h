
/*******************************************************************
*
* CAUTION: This file is automatically generated by libgen.
* Version: Xilinx EDK 10.1.03 EDK_K_SP3.6
* DO NOT EDIT.
*
* Copyright (c) 2005 Xilinx, Inc.  All rights reserved. 
* 
* Description: Driver parameters
*
*******************************************************************/

#define STDIN_BASEADDRESS 0x84000000
#define STDOUT_BASEADDRESS 0x84000000

/******************************************************************/


/* Definitions for peripheral XPS_BRAM_IF_CNTLR_1 */
#define XPAR_XPS_BRAM_IF_CNTLR_1_BASEADDR 0xFFFFC000
#define XPAR_XPS_BRAM_IF_CNTLR_1_HIGHADDR 0xFFFFFFFF


/* Definitions for peripheral XPS_BRAM_IF_CNTLR_2 */
#define XPAR_XPS_BRAM_IF_CNTLR_2_BASEADDR 0xFFFFA000
#define XPAR_XPS_BRAM_IF_CNTLR_2_HIGHADDR 0xFFFFBFFF


/******************************************************************/

/* Definitions for driver UARTLITE */
#define XPAR_XUARTLITE_NUM_INSTANCES 1

/* Definitions for peripheral RS232_UART */
#define XPAR_RS232_UART_BASEADDR 0x84000000
#define XPAR_RS232_UART_HIGHADDR 0x8400FFFF
#define XPAR_RS232_UART_DEVICE_ID 0
#define XPAR_RS232_UART_BAUDRATE 9600
#define XPAR_RS232_UART_USE_PARITY 0
#define XPAR_RS232_UART_ODD_PARITY 0
#define XPAR_RS232_UART_DATA_BITS 8


/******************************************************************/


/* Canonical definitions for peripheral RS232_UART */
#define XPAR_UARTLITE_0_DEVICE_ID XPAR_RS232_UART_DEVICE_ID
#define XPAR_UARTLITE_0_BASEADDR 0x84000000
#define XPAR_UARTLITE_0_HIGHADDR 0x8400FFFF
#define XPAR_UARTLITE_0_BAUDRATE 9600
#define XPAR_UARTLITE_0_USE_PARITY 0
#define XPAR_UARTLITE_0_ODD_PARITY 0
#define XPAR_UARTLITE_0_DATA_BITS 8
#define XPAR_UARTLITE_0_SIO_CHAN -1


/******************************************************************/

/* Definitions for driver GPIO */
#define XPAR_XGPIO_NUM_INSTANCES 1

/* Definitions for peripheral LEDS_8BIT */
#define XPAR_LEDS_8BIT_BASEADDR 0x81400000
#define XPAR_LEDS_8BIT_HIGHADDR 0x8140FFFF
#define XPAR_LEDS_8BIT_DEVICE_ID 0
#define XPAR_LEDS_8BIT_INTERRUPT_PRESENT 0
#define XPAR_LEDS_8BIT_IS_DUAL 0


/******************************************************************/

/* Definitions for driver TMRCTR */
#define XPAR_XTMRCTR_NUM_INSTANCES 1

/* Definitions for peripheral XPS_TIMER_1 */
#define XPAR_XPS_TIMER_1_DEVICE_ID 0
#define XPAR_XPS_TIMER_1_BASEADDR 0x83C00000
#define XPAR_XPS_TIMER_1_HIGHADDR 0x83C0FFFF


/******************************************************************/


/* Canonical definitions for peripheral XPS_TIMER_1 */
#define XPAR_TMRCTR_0_DEVICE_ID XPAR_XPS_TIMER_1_DEVICE_ID
#define XPAR_TMRCTR_0_BASEADDR 0x83C00000
#define XPAR_TMRCTR_0_HIGHADDR 0x83C0FFFF


/******************************************************************/

#define XPAR_INTC_MAX_NUM_INTR_INPUTS 2
#define XPAR_XINTC_HAS_IPR 1
#define XPAR_XINTC_USE_DCR 0
/* Definitions for driver INTC */
#define XPAR_XINTC_NUM_INSTANCES 1

/* Definitions for peripheral XPS_INTC_0 */
#define XPAR_XPS_INTC_0_DEVICE_ID 0
#define XPAR_XPS_INTC_0_BASEADDR 0x81800000
#define XPAR_XPS_INTC_0_HIGHADDR 0x8180FFFF
#define XPAR_XPS_INTC_0_KIND_OF_INTR 0x00000002


/******************************************************************/

#define XPAR_INTC_SINGLE_BASEADDR 0x81800000
#define XPAR_INTC_SINGLE_HIGHADDR 0x8180FFFF
#define XPAR_INTC_SINGLE_DEVICE_ID XPAR_XPS_INTC_0_DEVICE_ID
#define XPAR_XPS_TIMER_1_INTERRUPT_MASK 0X000001
#define XPAR_XPS_INTC_0_XPS_TIMER_1_INTERRUPT_INTR 0
#define XPAR_RS232_UART_INTERRUPT_MASK 0X000002
#define XPAR_XPS_INTC_0_RS232_UART_INTERRUPT_INTR 1

/******************************************************************/


/* Canonical definitions for peripheral XPS_INTC_0 */
#define XPAR_INTC_0_DEVICE_ID XPAR_XPS_INTC_0_DEVICE_ID
#define XPAR_INTC_0_BASEADDR 0x81800000
#define XPAR_INTC_0_HIGHADDR 0x8180FFFF
#define XPAR_INTC_0_KIND_OF_INTR 0x00000002

#define XPAR_INTC_0_TMRCTR_0_VEC_ID XPAR_XPS_INTC_0_XPS_TIMER_1_INTERRUPT_INTR
#define XPAR_INTC_0_UARTLITE_0_VEC_ID XPAR_XPS_INTC_0_RS232_UART_INTERRUPT_INTR

/******************************************************************/


/* Definitions for peripheral PPC405_0_DOCM_CNTLR */
#define XPAR_PPC405_0_DOCM_CNTLR_BASEADDR 0x40A04000
#define XPAR_PPC405_0_DOCM_CNTLR_HIGHADDR 0x40A07FFF


/* Definitions for peripheral PPC405_0_IOCM_CNTLR */
#define XPAR_PPC405_0_IOCM_CNTLR_BASEADDR 0x00000000
#define XPAR_PPC405_0_IOCM_CNTLR_HIGHADDR 0x00003FFF


/******************************************************************/

#define XPAR_CPU_PPC405_CORE_CLOCK_FREQ_HZ 100000000

/******************************************************************/

#define XPAR_CPU_ID 0
#define XPAR_PPC405_ID 0
#define XPAR_PPC405_CORE_CLOCK_FREQ_HZ 100000000
#define XPAR_PPC405_DPLB0_DWIDTH 64
#define XPAR_PPC405_DPLB0_NATIVE_DWIDTH 64
#define XPAR_PPC405_IPLB0_DWIDTH 64
#define XPAR_PPC405_IPLB0_NATIVE_DWIDTH 64
#define XPAR_PPC405_DPLB1_DWIDTH 64
#define XPAR_PPC405_DPLB1_NATIVE_DWIDTH 64
#define XPAR_PPC405_IPLB1_DWIDTH 64
#define XPAR_PPC405_IPLB1_NATIVE_DWIDTH 64
#define XPAR_PPC405_DPLB1_ADDR_BASE 0xffffffff
#define XPAR_PPC405_DPLB1_ADDR_HIGH 0x00000000
#define XPAR_PPC405_IPLB1_ADDR_BASE 0xffffffff
#define XPAR_PPC405_IPLB1_ADDR_HIGH 0x00000000
#define XPAR_PPC405_FASTEST_PLB_CLOCK DPLB0
#define XPAR_PPC405_GENERATE_PLB_TIMESPECS 1
#define XPAR_PPC405_DPLB0_P2P 0
#define XPAR_PPC405_DPLB1_P2P 1
#define XPAR_PPC405_IPLB0_P2P 0
#define XPAR_PPC405_IPLB1_P2P 1
#define XPAR_PPC405_ISOCM_DCR_BASEADDR 0x00000010
#define XPAR_PPC405_ISOCM_DCR_HIGHADDR 0x00000013
#define XPAR_PPC405_DSOCM_DCR_BASEADDR 0x00000020
#define XPAR_PPC405_DSOCM_DCR_HIGHADDR 0x00000023
#define XPAR_PPC405_DISABLE_OPERAND_FORWARDING 1
#define XPAR_PPC405_MMU_ENABLE 1
#define XPAR_PPC405_DETERMINISTIC_MULT 0
#define XPAR_PPC405_DCR_RESYNC 0
#define XPAR_PPC405_HW_VER "3.00.a"

/******************************************************************/
