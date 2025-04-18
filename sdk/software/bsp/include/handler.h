#ifndef _HANDLER_H
#define _HANDLER_H

#define ex_tlb_load_present_type        0x1
#define ex_tlb_store_present_type       0x2
#define ex_tlb_fetch_present_type       0x3
#define ex_tlb_modify_type              0x4
#define ex_tlb_read_inhibit_type        0x5
#define ex_tlb_execute_inhibit_type     0x6
#define ex_tlb_privilege_error_type     0x7
#define ex_ade_type                     0x8
#define ex_align_check_type             0x9
#define ex_bound_check_error_type       0xa
#define ex_syscall_type                 0xb
#define ex_break_type                   0xc
#define ex_ri_type                      0xd
#define ex_previlege_inst_type          0xe
#define ex_fpe_disable_type             0xf
#define ex_lsx_disable_type             0x10
#define ex_lasx_disable_type            0x11
#define ex_fpe_type                     0x12
#define ex_watch_type                   0x13
#define ex_bt_disable_type              0x14
#define ex_bt_help_type                 0x15
#define ex_psi_type                     0x16
#define ex_hypcall_type                 0x17
#define ex_field_change_type            0x18
#define ex_sate_related_type            0x19
#define ex_tlb_refill                   0x3f

#endif
