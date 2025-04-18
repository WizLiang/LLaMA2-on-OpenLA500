#include "regdef.h"
#include "uart_print.h"
#include "handler.h"

.extern UART_BASE

	.section .init
	.globl _start
	.type _start,@function

_start:

    ##init regs
    addi.w $r1,zero,0x0;  addi.w $r2,zero,0x0;  addi.w $r3,zero,0x0;  addi.w $r4,zero,0x0; 
    addi.w $r5,zero,0x0;  addi.w $r6,zero,0x0;  addi.w $r7,zero,0x0;  addi.w $r8,zero,0x0; 
    addi.w $r9,zero,0x0;  addi.w $r10,zero,0x0; addi.w $r11,zero,0x0; addi.w $r12,zero,0x0; 
    addi.w $r13,zero,0x0; addi.w $r14,zero,0x0; addi.w $r15,zero,0x0; addi.w $r16,zero,0x0; 
    addi.w $r17,zero,0x0; addi.w $r18,zero,0x0; addi.w $r19,zero,0x0; addi.w $r20,zero,0x0; 
    addi.w $r21,zero,0x0; addi.w $r22,zero,0x0; addi.w $r23,zero,0x0; addi.w $r24,zero,0x0; 
    addi.w $r25,zero,0x0; addi.w $r26,zero,0x0; addi.w $r27,zero,0x0; addi.w $r28,zero,0x0; 
    addi.w $r29,zero,0x0; addi.w $r30,zero,0x0; addi.w $r31,zero,0x0;  

#if has_cache==1
    # invalid the old inst in icache and old data in dcache by index
    li.w t0,0x0
    #li.w t2,0x100
    li.w t2, cache_index_depth
1: 
    #slli.w    t1, t0, 0x4
    slli.w    t1, t0, cache_offset_width
#if cache_way==1
    cacop     0x00, t1, 0x0 
    cacop     0x01, t1, 0x0
#elif cache_way==2
    cacop     0x00, t1, 0x0 
    cacop     0x00, t1, 0x1
    cacop     0x01, t1, 0x0
    cacop     0x01, t1, 0x1
#elif cache_way==4
    cacop     0x00, t1, 0x0 
    cacop     0x00, t1, 0x1
    cacop     0x00, t1, 0x2 
    cacop     0x00, t1, 0x3
    cacop     0x01, t1, 0x0
    cacop     0x01, t1, 0x1
    cacop     0x01, t1, 0x2
    cacop     0x01, t1, 0x3
#endif
    addi.w    t0, t0, 0x1
    bne       t0, t2, 1b
#else
    /* disable   cache */
    li.w    $r12,0x1
    csrwr	$r12,0x101
#endif

	/* open da mode */
    li.w	    $r12,0x8
    li.w	    $r13,0x18
    csrxchg	$r12,$r13,0x0

    /* init dmw  */
    csrwr	$r0,0x180
    csrwr	$r0,0x181
    li.w    $r12,0x09
    csrwr	$r12,0x180
    li.w    $r12,0xa0000009
    csrwr	$r12,0x181

    /* open pg mode  */
    li.w	    $r12,0x10
    li.w	    $r13,0x18
    csrxchg	$r12,$r13,0x0

    /* load data section */
	la.local t0, _data_lma
	la.local t1, _data
	la.local t2, _edata
	bgeu t1, t2, 2f
1:
	ld.w t3, t0, 0
	st.w t3, t1, 0
	addi.w t0, t0, 4
	addi.w t1, t1, 4
	bltu t1, t2, 1b
2:

	/* clear bss section */
	la.local t0, __bss_start
	la.local t1, _end
	bgeu t0, t1, 2f
1:
	st.w $r0, t0, 0
	addi.w t0, t0, 4
	bltu t0, t1, 1b
2:

    /* enable cache */
#if has_cache==1
    li.w    $r12,0x19
    csrwr	$r12,0x180
#else

#endif

	/* init UART */
	la.local    t0, UART_BASE
	ld.w        t1, t0, 0
	#WRITE(li.wne,OFS_FIFO,FIFO_ENABLE|FIFO_RCV_RST|FIFO_XMT_RST|FIFO_TRIGGER_0);
	li.w        t2, 0x07   
	st.b        t2, t1, 2
	#WRITE(li.wne,OFS_LINE_CONTROL, 0x80);
	li.w        t2, 0x80
	st.b        t2, t1, 3
	#WRITE(li.wne,OFS_DIVISOR_MSB, (divisor & 0xff00) >> 8); 
	li.w        t2, 0x00 
	st.b        t2, t1, 1 
	#WRITE(li.wne,OFS_DIVISOR_LSB, divisor & 0xff);
    li.w        t3, 0xbf20f500
    ld.w        t3, t3, 0
    li.w        t2, 0x1b
    beq         zero, t3, 1f
    li.w        t2, 0x1
1:
	st.b     t2, t1, 0 
	#WRITE(li.wne,OFS_DATA_FORMAT, data | parity | stop);
	li.w       t2, 0x3 
	st.b     t2, t1, 3
	#WRITE(li.wne,OFS_MODEM_CONTROL,0);
	li.w       t2, 0x0 
	st.b     t2, t1, 4 

    /* init exception */
#ifdef RTThread
    la.local t0, rtthread_irq_entry
#else
    la.local t0, trap_handler
#endif
    csrwr    t0, csr_eentry

    #clear int
    li.w        t1, 0x1
    csrwr       t1, csr_ticlr

    #enable int 
    li.w        t1, 0x4
#ifdef RTThread
    csrxchg     zero, t1, csr_crmd
#else
    csrxchg     t1, t1, csr_crmd
#endif
    csrwr       zero, csr_prmd
    li.w        t1, 0x1fff
    csrwr       zero, csr_ecfg
    csrwr       t1, csr_ecfg


	la.local	sp, _stack
    
	/* argc = argv = 0 */
	li.w a0, 0
	li.w a1, 0

#ifdef RTThread
    bl entry
#else
	bl main
#endif

	/*tail exit*/
	bl      _myexit
1:
	b 1b

.globl _myexit
.org 0x548
_myexit:
1:
	b 1b
	


