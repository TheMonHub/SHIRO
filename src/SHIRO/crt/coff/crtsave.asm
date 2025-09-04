%include "SHIRO/xmm_macro.asm.inc"

section .text
    global __crt_save_based_registers
    global __crt_restore_based_registers
__crt_save_based_registers:
    push rcx
    push rdx
    push r8
    push r9
    PUSHXMM xmm0
    PUSHXMM xmm1
    PUSHXMM xmm2
    PUSHXMM xmm3
    ret
__crt_restore_based_registers:
    POPXMM xmm3
    POPXMM xmm2
    POPXMM xmm1
    POPXMM xmm0
    pop r9
    pop r8
    pop rdx
    pop rcx
    ret