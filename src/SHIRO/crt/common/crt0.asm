extern main ; self explanatory
extern __ctors ; the constructors function provided by crti
; get rid of dtors since compiler seems to used atexit instead of dtors/fini section.
extern _exit ; real exit function. exit and any variant are wrappers around this
extern __crt_save_based_registers
extern __crt_restore_based_registers ; based as in based on current object file format. coff uses microsoft x64 calling convention, elf uses System V AMD64 ABI
extern __crt_normalize_first_param ; turn rcx into rdi for coff, do nothing for elf
extern __crt_convention_stack_shadow_space
extern __crt_convention_stack_shadow_space_end ; allocate and deallocate shadow space for coff, do nothing for elf
extern __libc_init ; run first do anything

section .data
    global __atexit_count
    __atexit_count dq 0

section .bss
    global __atexit_funcs
    global __atexit_start
    __atexit_funcs resq 4 ; limit of 4 atexit functions. Can be increased if needed. though likely never will be needed more.

section .text
    global _start
    global __main
    global exit
    global atexit
_start:
    call __libc_init
    call __crt_save_based_registers
    call __ctors ; initialize global objects
    call __crt_restore_based_registers

    call __crt_convention_stack_shadow_space
    call main
    call __crt_convention_stack_shadow_space_end

    mov rdi, rax
    jmp _exit_skip ; rdi is already normalized from main's return value so skip normalization. if not skip rcx will overwrite rdi in coff

exit:
    call __crt_normalize_first_param
_exit_skip: ; used when rdi is guaranteed to be normalized already
    push rdi
    mov rbx, [__atexit_count]
    imul rbx, rbx, 8
    add rbx, __atexit_funcs
    mov rax, rbx
.loop:
    sub rax, 8
    cmp rax, __atexit_funcs
    jbe .done

    mov rdi, [rax]
    call __crt_convention_stack_shadow_space
    call rdi
    call __crt_convention_stack_shadow_space_end
    jmp .loop
.done:
    pop rdi
    jmp _exit

__main: ; stub because we didn't actually needed this.
    ret

atexit: ; TODO: Add thread safety.
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