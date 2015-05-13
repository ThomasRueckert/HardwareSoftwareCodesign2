##############################################################################
## Filename:          H:\HSC\1\Lab1_Files\Prak1\PPC_ML310_Tutorial_10_1\Lab1_Task3\MyProcessorIPLib/drivers/blinker_v1_00_a/src/Makefile
## Description:       Microprocessor Driver Makefile
## Date:              Tue Apr 29 18:27:31 2014 (by Create and Import Peripheral Wizard)
##############################################################################

COMPILER=
ARCHIVER=
CP=cp
COMPILER_FLAGS=
EXTRA_COMPILER_FLAGS=
LIB=libxil.a

RELEASEDIR=../../../lib
INCLUDEDIR=../../../include
INCLUDES=-I./. -I${INCLUDEDIR}

INCLUDEFILES=*.h
LIBSOURCES=*.c
OUTS = *.o

libs:
	echo "Compiling blinker"
	$(COMPILER) $(COMPILER_FLAGS) $(EXTRA_COMPILER_FLAGS) $(INCLUDES) $(LIBSOURCES)
	$(ARCHIVER) -r ${RELEASEDIR}/${LIB} ${OUTS}
	make clean

include:
	${CP} $(INCLUDEFILES) $(INCLUDEDIR)

clean:
	rm -rf ${OUTS}
