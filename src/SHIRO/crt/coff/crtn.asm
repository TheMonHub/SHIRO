extern __dtors_start
extern __dtors_end

section .text
    global __dtors
__dtors:
    mov rax, __dtors_start + 8
.loop:
    cmp rax, __dtors_end
    jge .done
    mov rdi, [rax]
    call rdi
    add rax, 8
    jmp .loop
.done:
    ret