/*******************************************************************/
/*                                                                 */
/* This file is automatically generated by linker script generator.*/
/*                                                                 */
/* Version: Xilinx EDK 9.1.02EDK_J_SP2.4                                  */
/*                                                                 */
/* Copyright (c) 2004 Xilinx, Inc.  All rights reserved.           */
/*                                                                 */
/* Description : PowerPC405 Linker Script                         */
/*                                                                 */
/*******************************************************************/

_STACK_SIZE = DEFINED(_STACK_SIZE) ? _STACK_SIZE : 0x400;
_HEAP_SIZE = DEFINED(_HEAP_SIZE) ? _HEAP_SIZE : 0x400;

/* Define Memories in the system */

MEMORY
{
   plb_bram_if_cntlr_1 : ORIGIN = 0x00000000, LENGTH = 0x00004000
   opb_bram_if_cntlr_1 : ORIGIN = 0x40618000, LENGTH = 0x00002000
   iocm_cntlr : ORIGIN = 0xFFFFC000, LENGTH = 0x00004000
   docm_cntlr : ORIGIN = 0xA0E08000, LENGTH = 0x00004000
}

/* Specify the default entry point to the program */

ENTRY(_boot)
STARTUP(boot.o)

/* Define the sections, and where they are mapped in memory */

SECTIONS
{
.vectors : {
   __vectors_start = .;
   *(.vectors)
   __vectors_end = .;
} > plb_bram_if_cntlr_1

.text : {
   *(.text)
   *(.text.*)
   *(.gnu.linkonce.t.*)
} > iocm_cntlr

.init : {
   KEEP (*(.init))
} > iocm_cntlr

.fini : {
   KEEP (*(.fini))
} > iocm_cntlr

.rodata : {
   __rodata_start = .;
   *(.rodata)
   *(.rodata.*)
   *(.gnu.linkonce.r.*)
   __rodata_end = .;
} > docm_cntlr

.rodata1 : {
   __rodata1_start = .;
   *(.rodata1)
   *(.rodata1.*)
   __rodata1_end = .;
} > docm_cntlr

.sdata2 : {
   __sdata2_start = .;
   *(.sdata2)
   *(.sdata2.*)
   *(.gnu.linkonce.s2.*)
   __sdata2_end = .;
} > docm_cntlr

.sbss2 : {
   __sbss2_start = .;
   *(.sbss2)
   *(.sbss2.*)
   *(.gnu.linkonce.sb2.*)
   __sbss2_end = .;
} > docm_cntlr

.data : {
   __data_start = .;
   *(.data)
   *(.data.*)
   *(.gnu.linkonce.d.*)
   __data_end = .;
} > docm_cntlr

.data1 : {
   __data1_start = .;
   *(.data1)
   *(.data1.*)
   __data1_end = .;
} > docm_cntlr

.got : {
   *(.got)
} > docm_cntlr

.got1 : {
   *(.got1)
} > docm_cntlr

.got2 : {
   *(.got2)
} > docm_cntlr

.ctors : {
   __CTOR_LIST__ = .;
   ___CTORS_LIST___ = .;
   KEEP (*crtbegin.o(.ctors))
   KEEP (*(EXCLUDE_FILE(*crtend.o) .ctors))
   KEEP (*(SORT(.ctors.*)))
   KEEP (*(.ctors))
   __CTOR_END__ = .;
   ___CTORS_END___ = .;
} > docm_cntlr

.dtors : {
   __DTOR_LIST__ = .;
   ___DTORS_LIST___ = .;
   KEEP (*crtbegin.o(.dtors))
   KEEP (*(EXCLUDE_FILE(*crtend.o) .dtors))
   KEEP (*(SORT(.dtors.*)))
   KEEP (*(.dtors))
   __DTOR_END__ = .;
   ___DTORS_END___ = .;
} > docm_cntlr

.fixup : {
   __fixup_start = .;
   *(.fixup)
   __fixup_end = .;
} > docm_cntlr

.eh_frame : {
   *(.eh_frame)
} > docm_cntlr

.jcr : {
   *(.jcr)
} > docm_cntlr

.gcc_except_table : {
   *(.gcc_except_table)
} > docm_cntlr

.sdata : {
   __sdata_start = .;
   *(.sdata)
   *(.sdata.*)
   *(.gnu.linkonce.s.*)
   __sdata_end = .;
} > docm_cntlr

.sbss : {
   __sbss_start = .;
   *(.sbss)
   *(.sbss.*)
   *(.gnu.linkonce.sb.*)
   *(.scommon)
   __sbss_end = .;
} > docm_cntlr

.tdata : {
   __tdata_start = .;
   *(.tdata)
   *(.tdata.*)
   *(.gnu.linkonce.td.*)
   __tdata_end = .;
} > docm_cntlr

.tbss : {
   __tbss_start = .;
   *(.tbss)
   *(.tbss.*)
   *(.gnu.linkonce.tb.*)
   __tbss_end = .;
} > docm_cntlr

.bss : {
   __bss_start = .;
   *(.bss)
   *(.bss.*)
   *(.gnu.linkonce.b.*)
   *(COMMON)
   . = ALIGN(4);
   __bss_end = .;
} > docm_cntlr

.boot0 : {
   __boot0_start = .;
   *(.boot0)
   __boot0_end = .;
} > iocm_cntlr

.boot 0xFFFFFFFC : {
   __boot_start = .;
   *(.boot)
   __boot_end = .;
} 

/* Generate Stack and Heap Sections */

.stack : {
   _stack_end = .;
   . += _STACK_SIZE;
   . = ALIGN(16);
   __stack = .;
} > docm_cntlr

.heap : {
   . = ALIGN(16);
   _heap_start = .;
   . += _HEAP_SIZE;
   . = ALIGN(16);
   _heap_end = .;
   _end = .;
} > docm_cntlr

}

