set(CMAKE_SYSTEM_NAME Generic)

set(CMAKE_C_FLAGS "-ffreestanding -fno-stack-protector -nostdlib -mno-red-zone -fno-exceptions -fno-use-cxa-atexit")
set(CMAKE_CXX_FLAGS "-ffreestanding -fno-stack-protector -nostdlib -mno-red-zone -fno-exceptions -fno-use-cxa-atexit")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)