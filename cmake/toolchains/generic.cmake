set(CMAKE_ASM_NASM_COMPILE_OBJECT
        "<CMAKE_ASM_NASM_COMPILER> <FLAGS> -f elf64 <INCLUDES> -o <OBJECT> <SOURCE>"
)
set(CMAKE_C_COMPILE_OBJECT
        "<CMAKE_C_COMPILER> <FLAGS> -target x86_64-pc-none-elf  <INCLUDES> -c -o <OBJECT> <SOURCE>"
)
set(CMAKE_CXX_COMPILE_OBJECT
        "<CMAKE_CXX_COMPILER> <FLAGS> -target x86_64-pc-none-elf <INCLUDES> -c -o <OBJECT> <SOURCE>"
)

set(CMAKE_C_LINK_EXECUTABLE
        "<CMAKE_LINKER> -flavor gnu <LINK_FLAGS> -entry:_start -nodefaultlib --gc-sections <OBJECTS> <LINK_LIBRARIES> -o <TARGET>"
)

set(CMAKE_CXX_LINK_EXECUTABLE
        "<CMAKE_LINKER> -flavor gnu <LINK_FLAGS> -entry:_start -nodefaultlib --gc-sections <OBJECTS> <LINK_LIBRARIES> -o <TARGET>"
)

set(CMAKE_ASM_NASM_LINK_EXECUTABLE
        "<CMAKE_LINKER> -flavor gnu <LINK_FLAGS> -entry:_start -nodefaultlib --gc-sections <OBJECTS> <LINK_LIBRARIES> -o <TARGET>"
)