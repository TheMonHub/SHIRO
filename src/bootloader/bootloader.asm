section .data

section .rodata
    hello_world dw 'H', 'e', 'l', 'l', 'o', ',', ' ', 'W', 'o', 'r', 'l', 'd', '!', 0xD, 0xA, 0
section .bss

section .text
    global _start
_start:
    mov rcx, [rdx + 64]
    mov rax, [rcx + 8]
    mov rdx, hello_world
    sub rsp, 32
    call rax
    add rsp, 32
    ret