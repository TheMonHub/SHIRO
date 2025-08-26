extern g_common_hello_world_16
extern g_common_newline_16
section .data

section .rodata

section .bss
    print resq 1
    conout resq 1
section .text
    global _start
_start:
    mov rcx, [rdx + 64]
    mov rax, [rcx + 8]
    mov [print], rax
    mov [conout], rcx
    mov rdx, [g_common_hello_world_16]
    sub rsp, 32
    call rax
    add rsp, 32

    mov rcx, [conout]
    mov rax, [print]
    mov rdx, [g_common_newline_16]
    sub rsp, 32
    call rax
    add rsp, 32

    mov rcx, [conout]
    mov rax, [print]
    mov rdx, [g_common_hello_world_16]
    sub rsp, 32
    call rax
    add rsp, 32
    jmp $
    ret