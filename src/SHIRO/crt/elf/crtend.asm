section .init_array
    global __init_end
__init_end:
    dq 0
section .fini_array
    global __fini_end
__fini_end:
    dq 0