//////////////////////////////////////////////////////////////////////////////
// Filename:          H:\HSC\1\Lab1_Files\Prak1\PPC_ML310_Tutorial_10_1\Lab1_Task3\MyProcessorIPLib/drivers/blinker_v1_00_a/src/blinker.h
// Version:           1.00.a
// Description:       blinker Driver Header File
// Date:              Tue Apr 29 18:27:31 2014 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////

#ifndef BLINKER_H
#define BLINKER_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xio.h"

/************************** Constant Definitions ***************************/


/**
 * User Logic Slave Space Offsets
 * -- SLV_REG0 : user logic slave module register 0
 */
#define BLINKER_USER_SLV_SPACE_OFFSET (0x00000000)
#define BLINKER_SLV_REG0_OFFSET (BLINKER_USER_SLV_SPACE_OFFSET + 0x00000000)

/**************************** Type Definitions *****************************/


/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a BLINKER register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the BLINKER device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void BLINKER_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define BLINKER_mWriteReg(BaseAddress, RegOffset, Data) \
 	XIo_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a BLINKER register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the BLINKER device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	Xuint32 BLINKER_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define BLINKER_mReadReg(BaseAddress, RegOffset) \
 	XIo_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read 32 bit value to/from BLINKER user logic slave registers.
 *
 * @param   BaseAddress is the base address of the BLINKER device.
 * @param   RegOffset is the offset from the slave register to write to or read from.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note
 * C-style signature:
 * 	void BLINKER_mWriteSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Value)
 * 	Xuint32 BLINKER_mReadSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define BLINKER_mWriteSlaveReg0(BaseAddress, RegOffset, Value) \
 	XIo_Out32((BaseAddress) + (BLINKER_SLV_REG0_OFFSET) + (RegOffset), (Xuint32)(Value))

#define BLINKER_mReadSlaveReg0(BaseAddress, RegOffset) \
 	XIo_In32((BaseAddress) + (BLINKER_SLV_REG0_OFFSET) + (RegOffset))

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the BLINKER instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus BLINKER_SelfTest(void * baseaddr_p);

#endif // BLINKER_H
