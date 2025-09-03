extern __init_start
extern __init_end

section .text
    global __init
__init:
    push rax
    push rdi
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11

    mov rax, __init_start + 8

.loop:
    cmp rax, __init_end
    jge .done
    mov rdi, [rax]
    call rdi
    add rax, 8
    jmp .loop

.done:
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rdi
    pop rax
    ret