extern utf16_common_hello_world
extern utf16_common_newline
section .data

section .rodata

section .bss
    print resq 1
    conout resq 1
section .text
    global main
main:
    mov rcx, [rdx + 64]
    mov rax, [rcx + 8]
    mov [print], rax
    mov [conout], rcx
    mov rdx, [utf16_common_hello_world]
    sub rsp, 32
    call rax
    add rsp, 32

    mov rcx, [conout]
    mov rax, [print]
    mov rdx, [utf16_common_newline]
    sub rsp, 32
    call rax
    add rsp, 32

    mov rcx, [conout]
    mov rax, [print]
    mov rdx, [utf16_common_hello_world]
    sub rsp, 32
    call rax
    add rsp, 32
    jmp $
    ret