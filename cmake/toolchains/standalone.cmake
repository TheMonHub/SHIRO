set(CMAKE_SYSTEM_NAME Generic)

set(CMAKE_C_FLAGS "--freestanding -ffreestanding -fno-stack-protector -nostdlib")
set(CMAKE_EXE_LINKER_FLAGS "/nodefaultlib")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)