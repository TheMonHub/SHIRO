section .data

section .rodata
    EFI_LOADED_IMAGE_PROTOCOL_GUID:
        dd 0x5B1B31A1
        dw 0x9562
        dw 0x11d2
        db 0x8E, 0x3F, 0x00, 0xA0, 0xC9, 0x69, 0x72, 0x3B
    EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_GUID:
        dd 0x0964e5b2
        dw 0x6459
        dw 0x11d2
        db 0x8E, 0x39, 0x00, 0xA0, 0xC9, 0x69, 0x72, 0x3B
    bootloader_path:
        dw 'E','F','I',0x5C,'S','H','I','R','O',0x5C,'S','H','I','R','O','X','6','4','.','E','F','I',0
section .bss
    sys_table resq 1
    boot_services resq 1
    handle_protocol resq 1

    image_handle resq 1
    loaded_image resq 1
    file_system resq 1
    root_dir resq 1
    bootloader_handle resq 1
section .text
    global _start
_start:
    mov [sys_table], rdx
    mov [image_handle], rcx
    mov rcx, [rdx + 96]
    mov [boot_services], rcx
    mov rax, [rcx + 152]
    mov [handle_protocol], rax
    mov rcx, [image_handle]
    mov rdx, EFI_LOADED_IMAGE_PROTOCOL_GUID
    mov r8, loaded_image
    sub rsp, 32
    call rax
    add rsp, 32

    mov rax, [handle_protocol]
    mov rcx, [loaded_image]
    mov rcx, [rcx + 32]
    mov rdx, EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_GUID
    mov r8, file_system
    sub rsp, 32
    call rax
    add rsp, 32

    mov rax, [file_system]
    mov rax, [rax + 8]
    mov rcx, [file_system]
    mov rdx, root_dir
    sub rsp, 32
    call rax
    add rsp, 32

    mov rax, [boot_services]
    mov rax, [rax + 200]
    mov rcx, 0
    mov rdx, [image_handle]
    mov r8, bootloader_path
    mov r9, 0
    sub rsp, 48
    mov [rsp + 32], 0
    mov [rsp + 40], bootloader_handle
    call rax
    add rsp, 48

    mov rax, [boot_services]
    mov rax, [rax + 208]
    mov rcx, [bootloader_handle]
    mov rdx, 0
    mov r8, 0
    sub rsp, 32
    call rax
    add rsp, 32