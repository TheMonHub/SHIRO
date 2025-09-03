section .init_array
    global __init_start
__init_start:
    dq 0
section .fini_array
    global __fini_start
__fini_start:
    dq 0