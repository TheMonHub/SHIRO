extern __ctors_start
extern __ctors_end

section .text
    global __ctors
__ctors:
    mov rax, __ctors_start + 8
.loop:
    cmp rax, __ctors_end
    jge .done
    mov rdi, [rax]
    call rdi
    add rax, 8
    jmp .loop
.done:
    ret