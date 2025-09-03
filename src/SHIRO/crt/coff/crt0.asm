extern main
extern __ctors
extern __dtors

section .text
    global _start
_start:
    call __ctors
    call main
    call __dtors
    ret