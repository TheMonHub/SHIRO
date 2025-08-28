extern EFI_MAIN
extern __init_array_start
extern __xc_z
extern nothing
section .data

section .rodata

section .bss

section .text
    global _start
_start:
    call EFI_MAIN
    ret