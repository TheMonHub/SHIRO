extern main
extern __init
extern __fini

section .text
    global _start
_start:
    call __init
    call main
    call __fini
    ret