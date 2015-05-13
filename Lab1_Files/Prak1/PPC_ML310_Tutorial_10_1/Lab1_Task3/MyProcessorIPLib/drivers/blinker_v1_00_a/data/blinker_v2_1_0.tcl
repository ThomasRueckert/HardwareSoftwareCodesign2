##############################################################################
## Filename:          H:\HSC\1\Lab1_Files\Prak1\PPC_ML310_Tutorial_10_1\Lab1_Task3\MyProcessorIPLib/drivers/blinker_v1_00_a/data/blinker_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Tue Apr 29 18:27:31 2014 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "blinker" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
