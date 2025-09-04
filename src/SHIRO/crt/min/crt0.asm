extern main

section .text
    global _start
    global __main
_start:
    call main
__main:
    ret