#ifndef _SYS_REGDEF_H
#define _SYS_REGDEF_H

# define zero   $r0
# define ra     $r1
# define tp     $r2
# define sp     $r3
# define a0     $r4
# define a1     $r5
# define a2     $r6
# define a3     $r7
# define a4     $r8
# define a5     $r9
# define a6     $r10
# define a7     $r11
# define v0     $r4
# define v1     $r5
# define t0     $r12
# define t1     $r13
# define t2     $r14
# define t3     $r15
# define t4     $r16
# define t5     $r17
# define t6     $r18
# define t7     $r19
# define t8     $r20
# define x      $r21
# define fp     $r22
# define s0     $r23
# define s1     $r24
# define s2     $r25
# define s3     $r26
# define s4     $r27
# define s5     $r28
# define s6     $r29
# define s7     $r30
# define s8     $r31

# define fa0    $f0
# define fa1    $f1
# define fa2    $f2
# define fa3    $f3
# define fa4    $f4
# define fa5    $f5
# define fa6    $f6
# define fa7    $f7
# define fv0    $f0
# define fv1    $f1
# define ft0    $f8
# define ft1    $f9
# define ft2    $f10
# define ft3    $f11
# define ft4    $f12
# define ft5    $f13
# define ft6    $f14
# define ft7    $f15
# define ft8    $f16
# define ft9    $f17
# define ft10   $f18
# define ft11   $f19
# define ft12   $f20
# define ft13   $f21
# define ft14   $f22
# define ft15   $f23
# define fs0    $f24
# define fs1    $f25
# define fs2    $f26
# define fs3    $f27
# define fs4    $f28
# define fs5    $f29
# define fs6    $f30
# define fs7    $f31

#define csr_crmd      0x0
#define csr_prmd      0x1
#define csr_euen      0x2
#define csr_ecfg      0x4
#define csr_estat     0x5
#define csr_era       0x6
#define csr_badv      0x7
#define csr_eentry     0xc
#define csr_tlbidx    0x10
#define csr_tlbehi    0x11
#define csr_tlbelo0    0x12
#define csr_tlbelo1    0x13
#define csr_asid      0x18
#define csr_pgdl      0x19
#define csr_pgdh      0x1a
#define csr_pgd       0x1b
#define csr_cpuid    0x20
#define csr_save0     0x30
#define csr_save1     0x31
#define csr_save2     0x32
#define csr_save3     0x33
#define csr_tid       0x40
#define csr_tcfg      0x41
#define csr_tval      0x42
#define csr_ticlr     0x44
#define csr_llbctl    0x60
#define csr_tlbrentry 0x88
#define csr_dmw0      0x180
#define csr_dmw1      0x181

#endif
