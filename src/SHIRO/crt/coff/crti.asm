extern __ctors_start
extern __ctors_end

section .text
    global __ctors
__ctors:
    mov rax, __ctors_start + 8
.loop:
    mov rdi, [rax]
    call rdi
    add rax, 8
    cmp rax, __ctors_end
    jge .done

    jmp .loop
.done:
    ret