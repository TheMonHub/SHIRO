section .init_array
    global __ctors_end
__ctors_end:
    dq 0
section .fini_array
    global __dtors_end
__dtors_end:
    dq 0