extern main
extern __init
extern __fini

section .text
    global _start
    global __main
_start:
    call __init
    call main
    call __fini
__main:
    ret