section .text
    global __crt_normalize_first_param
    global __crt_convention_stack_shadow_space
    global __crt_convention_stack_shadow_space_end
__crt_normalize_first_param:
    mov rdi, rcx
    ret
__crt_convention_stack_shadow_space:
    sub rsp, 32
    ret
__crt_convention_stack_shadow_space_end:
    add rsp, 32
    ret