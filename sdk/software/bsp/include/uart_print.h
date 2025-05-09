#ifndef _UART_PRINT_H
#define _UART_PRINT_H

#define UART_PRINT(str)\
    la      a0, 1f;\
    .section .rodata       ;\
    1:           ;\
    .asciz  str  ;\
    .section .init        ;\
    bl          %plt(puts)

#endif
