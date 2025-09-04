extern main ; self explanatory
extern __ctors
extern __dtors ; the constructors and destructors function provided by crti and crtn
extern _exit ; real exit function. exit and any variant are wrappers around this
extern __crt_save_based_registers
extern __crt_restore_based_registers ; based as in based on current object file format. coff uses microsoft x64 calling convention, elf uses System V AMD64 ABI
extern __crt_normalize_first_param ; turn rcx into rdi for coff, do nothing for elf
extern __crt_convention_stack_shadow_space
extern __crt_convention_stack_shadow_space_end ; allocate and deallocate shadow space for coff, do nothing for elf
extern __crt_init ; run first do anything

section .data
    global __atexit_count
    __atexit_count dq 0

section .bss
    global __atexit_funcs
    __atexit_funcs resq 64 ; limit of 64 atexit functions. Can be increased if needed. though likely never will be needed more.

section .text
    global _start
    global __main
    global exit
    global atexit
    global _exit_skip
_start:
    call __crt_init
    call __crt_save_based_registers
    call __ctors ; initialize global objects
    call __crt_restore_based_registers

    call __crt_convention_stack_shadow_space
    call main
    call __crt_convention_stack_shadow_space_end

    push rax
    call __dtors ; destroy global objects. only keep the return value of main
    pop rdi ; pop main's return value into rdi for exit
    jmp _exit_skip ; rdi is already normalized from main's return value so skip normalization. if not skip rcx will overwrite rdi in coff

exit:
    call __crt_normalize_first_param
_exit_skip: ; used when rdi is guaranteed to be normalized already
    push rdi
    mov rax, __atexit_funcs
.loop:
    add rax, 8
    mov rbx, [__atexit_count]
    imul rbx, rbx, 8
    add rbx, __atexit_funcs
    cmp rax, rbx
    jae .done

    mov rdi, [rax]
    call __crt_convention_stack_shadow_space
    call rdi
    call __crt_convention_stack_shadow_space_end
    jmp .loop
.done:
    pop rdi
    jmp _exit

__main: ; stub
    ret

atexit:
    mov rax, [__atexit_count]
    cmp rax, 64
    jae .full
    call __crt_normalize_first_param
    mov [__atexit_funcs + rax * 8], rdi
    inc qword [__atexit_count]
    xor rax, rax
    ret
.full:
    mov rax, 1
    ret