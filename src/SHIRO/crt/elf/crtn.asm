extern __fini_start
extern __fini_end

section .text
    global __fini
__fini:
    mov rax, __fini_start + 8
.loop:
    mov rdi, [rax]
    call rdi
    add rax, 8
    cmp rax, __fini_end
    jge .done

    jmp .loop
.done:
    ret