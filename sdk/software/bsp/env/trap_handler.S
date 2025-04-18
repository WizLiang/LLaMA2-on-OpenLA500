#include "regdef.h"

.macro TRAP_ENTRY_SETJMP
    addi.w sp, sp, -124

    st.w ra, sp, 120
    st.w tp, sp, 116
    st.w sp, sp, 112
    st.w a0, sp, 108
    st.w a1, sp, 104
    st.w a2, sp, 100
    st.w a3, sp, 96
    st.w a4, sp, 92
    st.w a5, sp, 88
    st.w a6, sp, 84
    st.w a7, sp, 80
    st.w t0, sp, 76
    st.w t1, sp, 72
    st.w t2, sp, 68
    st.w t3, sp, 64
    st.w t4, sp, 60
    st.w t5, sp, 56
    st.w t6, sp, 52
    st.w t7, sp, 48
    st.w t8, sp, 44
    st.w $r21, sp,40
    st.w fp, sp, 36
    st.w s0, sp, 32
    st.w s1, sp, 28
    st.w s2, sp, 24
    st.w s3, sp, 20
    st.w s4, sp, 16
    st.w s5, sp, 12
    st.w s6, sp, 8
    st.w s7, sp, 4
    st.w s8, sp, 0

.endm

.macro TRAP_EXIT_LONGJMP

    ld.w ra, sp, 120
    ld.w tp, sp, 116
    ld.w sp, sp, 112
    ld.w a0, sp, 108
    ld.w a1, sp, 104
    ld.w a2, sp, 100
    ld.w a3, sp, 96
    ld.w a4, sp, 92
    ld.w a5, sp, 88
    ld.w a6, sp, 84
    ld.w a7, sp, 80
    ld.w t0, sp, 76
    ld.w t1, sp, 72
    ld.w t2, sp, 68
    ld.w t3, sp, 64
    ld.w t4, sp, 60
    ld.w t5, sp, 56
    ld.w t6, sp, 52
    ld.w t7, sp, 48
    ld.w t8, sp, 44
    ld.w $r21, sp,40
    ld.w fp, sp, 36
    ld.w s0, sp, 32
    ld.w s1, sp, 28
    ld.w s2, sp, 24
    ld.w s3, sp, 20
    ld.w s4, sp, 16
    ld.w s5, sp, 12
    ld.w s6, sp, 8
    ld.w s7, sp, 4
    ld.w s8, sp, 0

    addi.w sp, sp, 124

    ertn

.endm

    .section      .text	
    .align 6
    .global trap_handler
    .weak   trap_handler
trap_handler:

    TRAP_ENTRY_SETJMP

    csrrd   a0, csr_estat
    csrrd   a1, csr_era

    srli.w  t0, a0, 16                  
    bne     zero, t0, is_exceptions
    andi    t0, a0, 0x3FC
    srli.w  t1, t0, 2         

    # 根据中断号跳转到相应的处理程序 priority
    move t2, t1            
    andi t2, t2, 0x1        
    li.w t8, 0x1 
    beq  t2, t8, handle_hwi0	  

    move t2, t1              
    andi t2, t2, 0x2          
    li.w t8, 0x2 
    beq  t2, t8, handle_hwi1	  

    move t2, t1                 
    andi t2, t2, 0x4           
    li.w t8, 0x4 
    beq  t2, t8, handle_hwi2	    

    move t2, t1                  
    andi t2, t2, 0x8             
    li.w t8, 0x8 
    beq  t2, t8, handle_hwi3	    

    move t2, t1                  
    andi t2, t2, 0x10              
    li.w t8, 0x10 
    beq  t2, t8, handle_hwi4	  

    move t2, t1                  
    andi t2, t2, 0x20             
    li.w t8, 0x20 
    beq  t2, t8, handle_hwi5	  

    move t2, t1                   
    andi t2, t2, 0x40            
    li.w t8, 0x40 
    beq  t2, t8, handle_hwi6	   

    move t2, t1
    andi t2, t2, 0x80
    li.w t8, 0x80 
    beq  t2, t8, handle_hwi7

    b trap_jump_exit

is_exceptions:
    addi.w t8, a1, 4
    csrwr t8, csr_era
1:
    b 1b

trap_jump_exit:
    TRAP_EXIT_LONGJMP


# HWI0 处理程序
handle_hwi0:

    bl HWI0_IntrHandler

    b trap_jump_exit

# HWI1 处理程序
handle_hwi1:
    b trap_jump_exit

# HWI2 处理程序
handle_hwi2:
    b trap_jump_exit

# HWI3 处理程序
handle_hwi3:
    b trap_jump_exit

# HWI4 处理程序
handle_hwi4:
    b trap_jump_exit

# HWI5 处理程序
handle_hwi5:
    b trap_jump_exit

# HWI6 处理程序
handle_hwi6:
    b trap_jump_exit

# HWI7 处理程序
handle_hwi7:
    b trap_jump_exit


.weak HWI0_IntrHandler
HWI0_IntrHandler:
1:
  b 1b
