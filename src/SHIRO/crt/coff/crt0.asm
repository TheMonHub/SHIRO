extern main
extern __ctors
extern __dtors

section .text
    global _start
    global __main
_start:
    call __ctors
    call main
    call __dtors
__main:
    ret