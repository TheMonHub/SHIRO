extern __fini_start
extern __fini_end

section .text
    global __fini
__fini:
    push rax
    push rdi
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11

    mov rax, __fini_start + 8

.loop:
    cmp rax, __fini_end
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