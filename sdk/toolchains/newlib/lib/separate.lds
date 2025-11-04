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
    . = ALIGN(4);
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
  } >isram AT>isram
  .fini :
  {
    KEEP (*(SORT_NONE(.fini)))
  } >isram AT>isram
  . = ALIGN(4);
  PROVIDE (__etext = .);
  PROVIDE (_etext = .);
  PROVIDE (etext = .);
  PROVIDE( _eisram = . );
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
    . = ALIGN(4);
    PROVIDE( _eisram = . );
  .lalign :
  {
    . = ALIGN(4);
    PROVIDE( _data_lma = . );
  } >isram AT>isram
  .dalign :
  {
    . = ALIGN(4);
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
    . = ALIGN(8);
    PROVIDE( __global_pointer$ = . + 0x800 );
    *(.sdata .sdata.*)
    *(.gnu.linkonce.s.*)
    . = ALIGN(8);
    *(.srodata.cst16)
    *(.srodata.cst8)
    *(.srodata.cst4)
    *(.srodata.cst2)
    *(.srodata .srodata.*)
  } >dsram AT>isram
  . = ALIGN(4);
  PROVIDE( _edata = . );
  PROVIDE( edata = . );
  PROVIDE( _fbss = . );
  PROVIDE( __bss_start = . );
  .bss :
  {
    *(.sbss*)
    *(.gnu.linkonce.sb.*)
    *(.bss .bss.*)
    *(.gnu.linkonce.b.*)
    *(COMMON)
    . = ALIGN(4);
  } >dsram AT>dsram
  . = ALIGN(8);
  PROVIDE( _end = . );
  PROVIDE( end = . );
  .stack ORIGIN(dsram) + LENGTH(dsram) - __stack_size :
  {
    PROVIDE( _heap_end = . );
    . = __stack_size;
    PROVIDE( _stack = . );
  } >dsram AT>dsram
}
