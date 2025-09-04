%include "SHIRO/xmm_macro.asm.inc"

section .text
    global __crt_save_based_registers
    global __crt_restore_based_registers
__crt_save_based_registers:
    push rdi
    push rsi
    push rdx
    push rcx
    push r8
    push r9
    PUSHXMM xmm0
    PUSHXMM xmm1
    PUSHXMM xmm2
    PUSHXMM xmm3
    PUSHXMM xmm4
    PUSHXMM xmm5
    ret
__crt_restore_based_registers:
    POPXMM xmm5
    POPXMM xmm4
    POPXMM xmm3
    POPXMM xmm2
    POPXMM xmm1
    POPXMM xmm0
    pop r9
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    ret