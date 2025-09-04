extern __dtors_start
extern __dtors_end
extern __crt_convention_stack_shadow_space
extern __crt_convention_stack_shadow_space_end

section .text
    global __dtors
__dtors:
    mov rax, __dtors_start + 8
.loop:
    add rax, 8
    cmp rax, __dtors_end
    jae .done

    mov rdi, [rax]
    call __crt_convention_stack_shadow_space
    call rdi
    call __crt_convention_stack_shadow_space_end
    jmp .loop
.done:
    ret