section .init_array
    global __ctors_start
__ctors_start:
    dq 0
section .fini_array
    global __dtors_start
__dtors_start:
    dq 0