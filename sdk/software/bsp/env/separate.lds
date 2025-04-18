OUTPUT_ARCH(loongarch)
ENTRY(_start)

MEMORY
{
  isram (rwxai) : ORIGIN = 0x1c000000, LENGTH = 512K
  dsram (rwxai) : ORIGIN = 0x1c080000, LENGTH = 512K
}
SECTIONS
{
  __stack_size = DEFINED(__stack_size) ? __stack_size : 64K;
  .init :
  {
    KEEP (*(SORT_NONE(.init)))
  } >isram AT>isram
  .ilalign :
  {
    . = ALIGN(16);
    PROVIDE( _isram_lma = . );
  } >isram AT>isram
  .ialign :
  {
    PROVIDE( _isram = . );
  } >isram AT>isram
  .text :
  {
    _ftext = . ;
    *(.text.unlikely .text.unlikely.*)
    *(.text.startup .text.startup.*)
    *(.text .text.*)
    *(.gnu.linkonce.t.*)
    
    /* section information for finsh shell */
    . = ALIGN(4);
    __fsymtab_start = .;
    KEEP(*(FSymTab))
    __fsymtab_end = .;

    . = ALIGN(4);
    __vsymtab_start = .;
    KEEP(*(VSymTab))
    __vsymtab_end = .;

    /* section information for utest */
    . = ALIGN(4);
    __rt_utest_tc_tab_start = .;
    KEEP(*(UtestTcTab))
    __rt_utest_tc_tab_end = .;

    /* section information for at server */
    . = ALIGN(4);
    __rtatcmdtab_start = .;
    KEEP(*(RtAtCmdTab))
    __rtatcmdtab_end = .;
    . = ALIGN(4);

    /* section information for initial. */
    . = ALIGN(4);
    __rt_init_start = .;
    KEEP(*(SORT(.rti_fn*)))
    __rt_init_end = .;

  } >isram AT>isram
  .fini :
  {
    KEEP (*(SORT_NONE(.fini)))
  } >isram AT>isram
  . = ALIGN(16);
  PROVIDE (__etext = .);
  PROVIDE (_etext = .);
  PROVIDE (etext = .);

  .preinit_array :
  {
    PROVIDE_HIDDEN (__preinit_array_start = .);
    KEEP (*(.preinit_array))
    PROVIDE_HIDDEN (__preinit_array_end = .);
  } >isram AT>isram
  .init_array :
  {
    PROVIDE_HIDDEN (__init_array_start = .);
    KEEP (*(SORT_BY_INIT_PRIORITY(.init_array.*) SORT_BY_INIT_PRIORITY(.ctors.*)))
    KEEP (*(.init_array EXCLUDE_FILE (*crtbegin.o *crtbegin?.o *crtend.o *crtend?.o ) .ctors))
    PROVIDE_HIDDEN (__init_array_end = .);
  } >isram AT>isram
  .fini_array :
  {
    PROVIDE_HIDDEN (__fini_array_start = .);
    KEEP (*(SORT_BY_INIT_PRIORITY(.fini_array.*) SORT_BY_INIT_PRIORITY(.dtors.*)))
    KEEP (*(.fini_array EXCLUDE_FILE (*crtbegin.o *crtbegin?.o *crtend.o *crtend?.o ) .dtors))
    PROVIDE_HIDDEN (__fini_array_end = .);
  } >isram AT>isram
  .ctors :
  {
    KEEP (*crtbegin.o(.ctors))
    KEEP (*crtbegin?.o(.ctors))
    KEEP (*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .ctors))
    KEEP (*(SORT(.ctors.*)))
    KEEP (*(.ctors))
  } >isram AT>isram
  .dtors :
  {
    KEEP (*crtbegin.o(.dtors))
    KEEP (*crtbegin?.o(.dtors))
    KEEP (*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .dtors))
    KEEP (*(SORT(.dtors.*)))
    KEEP (*(.dtors))
  } >isram AT>isram

  . = ALIGN(16);
  .ex_table_base :
  {
	  _ex_table_base_start = .;
	  . = 0x500;
	  _ex_table_base_end = .;
  } >isram AT>isram

  . = ALIGN(16);
  PROVIDE( _eisram = . );

  .lalign :
  {
    . = ALIGN(16);
    PROVIDE( _data_lma = . );
  } >isram AT>isram
  .dalign :
  {
    . = ALIGN(16);
    PROVIDE( _data = . );
  } >dsram AT>isram
  .data :
  {
    *(.rdata)
    *(.rodata .rodata.*)
    rodata_end = .;
    *(.gnu.linkonce.r.*)
    *(.data .data.*)
    *(.gnu.linkonce.d.*)
    . = ALIGN(16);
    PROVIDE( __global_pointer$ = . + 0x800 );
    *(.sdata .sdata.*)
    *(.gnu.linkonce.s.*)
    . = ALIGN(16);
    *(.srodata.cst16)
    *(.srodata.cst8)
    *(.srodata.cst4)
    *(.srodata.cst2)
    *(.srodata .srodata.*)
  } >dsram AT>isram
  . = ALIGN(16);
  PROVIDE( _edata = . );
  PROVIDE( edata = . );
  PROVIDE( _fbss = . );
  .bss :
  {
    PROVIDE( __bss_start = . );
    *(.sbss*)
    *(.sbss.*)
    *(.dynsbss)
    *(.scommon) 
    *(.bss)
		*(.bss.*)
		*(.dynbss)
    *(.gnu.linkonce.sb.*)
    *(.bss .bss.*)
    *(.gnu.linkonce.b.*)
    *(COMMON)
    . = ALIGN(16);
  } >dsram AT>dsram
  . = ALIGN(16);
  PROVIDE( _end = . );
  PROVIDE( end = . );
  PROVIDE (__heap_start = _end);
  .stack ORIGIN(dsram) + LENGTH(dsram) - __stack_size :
  {
    PROVIDE( _heap_end = . );
    PROVIDE (__heap_end = _heap_end);
    PROVIDE (__heap_size = __heap_end - __heap_start);
    . = __stack_size;
    PROVIDE( _stack = . );
  } >dsram AT>dsram
}
