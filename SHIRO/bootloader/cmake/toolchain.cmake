set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

set(CMAKE_C_FLAGS "-ffreestanding -fno-stack-protector -nostdlib -mno-red-zone -fno-exceptions")
set(CMAKE_CXX_FLAGS "-ffreestanding -fno-stack-protector -nostdlib -mno-red-zone -fno-exceptions")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

if (NOT DEFINED CLANG AND NOT DEFINED CLANG++ AND NOT DEFINED LLD)
    find_program(CLANG NAMES clang REQUIRED)
    find_program(CLANG++ NAMES clang++ REQUIRED)
    find_program(LLD NAMES lld REQUIRED)

    message(NOTICE "=================================================")
    message(NOTICE "Checking for Clang/LLVM")
    message(NOTICE "=================================================")
    message(STATUS "Found Clang: ${CLANG}")
    message(STATUS "Found Clang++: ${CLANG++}")
    message(STATUS "Found LLD: ${LLD}")
endif ()

set(CMAKE_ASM_NASM_COMPILE_OBJECT
        "<CMAKE_ASM_NASM_COMPILER> <FLAGS> -f win64 <INCLUDES> -o <OBJECT> <SOURCE>"
)
set(CMAKE_C_COMPILE_OBJECT
        "<CMAKE_C_COMPILER> <FLAGS> -target x86_64-pc-windows-gnu  <INCLUDES> -c -o <OBJECT> <SOURCE>"
)
set(CMAKE_CXX_COMPILE_OBJECT ${CMAKE_C_COMPILE_OBJECT})
set(CMAKE_CXX_COMPILE_OBJECT ${CMAKE_C_COMPILE_OBJECT})
set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> -flavor link -subsystem:efi_application -entry:_start -nodefaultlib ${KURO_CRTA} <OBJECTS> <LINK_LIBRARIES> ${KURO_CRTZ} /out:<TARGET>")
set(CMAKE_CXX_LINK_EXECUTABLE ${CMAKE_C_LINK_EXECUTABLE})
set(CMAKE_ASM_NASM_LINK_EXECUTABLE "<CMAKE_LINKER> -flavor link -subsystem:efi_application -entry:main -nodefaultlib <OBJECTS> <LINK_LIBRARIES> /out:<TARGET>")
set(CMAKE_EXECUTABLE_SUFFIX ".EFI")

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")

set(CMAKE_STATIC_LIBRARY_PREFIX "efi_")
set(CMAKE_SHARED_LIBRARY_PREFIX "efi_")