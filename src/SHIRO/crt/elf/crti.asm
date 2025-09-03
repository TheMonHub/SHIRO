extern __init_start
extern __init_end

section .text
    global __init
__init:
    mov rax, __init_start + 8
.loop:
    mov rdi, [rax]
    call rdi
    add rax, 8
    cmp rax, __init_end
    jge .done

    jmp .loop
.done:
    ret