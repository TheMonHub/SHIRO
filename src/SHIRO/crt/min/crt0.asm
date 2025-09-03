extern main

section .text
    global _start
_start:
    call main
__main:
    ret