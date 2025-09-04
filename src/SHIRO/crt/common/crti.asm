extern __ctors_start
extern __ctors_end
extern __crt_convention_stack_shadow_space
extern __crt_convention_stack_shadow_space_end

section .text
    global __ctors
__ctors:
    mov rax, __ctors_start + 8
.loop:
    add rax, 8
    cmp rax, __ctors_end
    jae .done

    mov rdi, [rax]
    call __crt_convention_stack_shadow_space
    call rdi
    call __crt_convention_stack_shadow_space_end
    jmp .loop
.done:
    ret