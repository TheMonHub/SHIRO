cmake_minimum_required(VERSION 3.29 FATAL_ERROR)

project(
        SHIRO_CRT_FREESTANDING
        VERSION 0.1.0
        DESCRIPTION "SHIRO C Runtime for Freestanding x86_64"
        LANGUAGES ASM_NASM
)

set(ELF_COMMAND ${CMAKE_ASM_NASM_COMPILER} -f elf64 -I${INCLUDE_DIRECTORY} $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:-g> -F dwarf)
set(COFF_COMMAND ${CMAKE_ASM_NASM_COMPILER} -f win64 -I${INCLUDE_DIRECTORY} $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:-g> -F cv8)

add_custom_target(SHIRO_CRT_ELF ALL
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/CRT/ELF

        COMMAND ${ELF_COMMAND} elf/crtbegin.asm -o ${CMAKE_BINARY_DIR}/CRT/ELF/crtbegin.o
        COMMAND ${ELF_COMMAND} elf/crtend.asm -o ${CMAKE_BINARY_DIR}/CRT/ELF/crtend.o
        COMMAND ${ELF_COMMAND} elf/crtnormalize.asm -o ${CMAKE_BINARY_DIR}/CRT/ELF/crtnormalize.o
        COMMAND ${ELF_COMMAND} elf/crtsave.asm -o ${CMAKE_BINARY_DIR}/CRT/ELF/crtsave.o
        COMMAND ${ELF_COMMAND} common/crti.asm -o ${CMAKE_BINARY_DIR}/CRT/ELF/crti.o
        COMMAND ${ELF_COMMAND} common/crtn.asm -o ${CMAKE_BINARY_DIR}/CRT/ELF/crtn.o
        COMMAND ${ELF_COMMAND} common/crt0.asm -o ${CMAKE_BINARY_DIR}/CRT/ELF/crt0.o
        COMMENT "Building CRT object for ELF"
        VERBATIM
)

add_custom_target(SHIRO_CRT_EFI ALL
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/CRT/EFI

        COMMAND ${COFF_COMMAND} efi/crtinit.asm -o ${CMAKE_BINARY_DIR}/CRT/EFI/crtinit.o
        COMMAND ${COFF_COMMAND} efi/crtexit.asm -o ${CMAKE_BINARY_DIR}/CRT/EFI/crtexit.o
        COMMENT "Building CRT object for EFI"
        VERBATIM
)

add_custom_target(SHIRO_CRT_MIN_ELF ALL
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/CRT/MIN_ELF

        COMMAND ${COFF_COMMAND} min/crt0.asm -o ${CMAKE_BINARY_DIR}/CRT/MIN_ELF/crt0.o
        COMMENT "Building CRT object for MIN_COFF"
        VERBATIM
)

add_custom_target(SHIRO_CRT_MIN_COFF ALL
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/CRT/MIN_COFF

        COMMAND ${COFF_COMMAND} min/crt0.asm -o ${CMAKE_BINARY_DIR}/CRT/MIN_COFF/crt0.o
        COMMENT "Building CRT object for MIN_COFF"
        VERBATIM
)

add_custom_target(SHIRO_CRT_COFF ALL
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/CRT/COFF

        COMMAND ${COFF_COMMAND} coff/crtbegin.asm -o ${CMAKE_BINARY_DIR}/CRT/COFF/crtbegin.o
        COMMAND ${COFF_COMMAND} coff/crtend.asm -o ${CMAKE_BINARY_DIR}/CRT/COFF/crtend.o
        COMMAND ${COFF_COMMAND} coff/crtnormalize.asm -o ${CMAKE_BINARY_DIR}/CRT/COFF/crtnormalize.o
        COMMAND ${COFF_COMMAND} coff/crtsave.asm -o ${CMAKE_BINARY_DIR}/CRT/COFF/crtsave.o
        COMMAND ${COFF_COMMAND} common/crti.asm -o ${CMAKE_BINARY_DIR}/CRT/COFF/crti.o
        COMMAND ${COFF_COMMAND} common/crtn.asm -o ${CMAKE_BINARY_DIR}/CRT/COFF/crtn.o
        COMMAND ${COFF_COMMAND} common/crt0.asm -o ${CMAKE_BINARY_DIR}/CRT/COFF/crt0.o
        COMMENT "Building CRT object for COFF"
        VERBATIM
)

set(SHIRO_CXX_PREOBJECTS_ELF "${CMAKE_BINARY_DIR}/CRT/ELF/crt0.o ${CMAKE_BINARY_DIR}/CRT/ELF/crtnormalize.o ${CMAKE_BINARY_DIR}/CRT/ELF/crtsave.o ${CMAKE_BINARY_DIR}/CRT/ELF/crti.o ${CMAKE_BINARY_DIR}/CRT/ELF/crtbegin.o" CACHE INTERNAL "objects to get first include in every link in elf" FORCE)
set(SHIRO_CXX_POSTOBJECTS_ELF "${CMAKE_BINARY_DIR}/CRT/ELF/crtend.o ${CMAKE_BINARY_DIR}/CRT/ELF/crtn.o" CACHE INTERNAL "objects to get last include in every link in elf" FORCE)

set(SHIRO_CXX_PREOBJECTS_COFF "${CMAKE_BINARY_DIR}/CRT/COFF/crt0.o ${CMAKE_BINARY_DIR}/CRT/COFF/crtnormalize.o ${CMAKE_BINARY_DIR}/CRT/COFF/crtsave.o ${CMAKE_BINARY_DIR}/CRT/COFF/crti.o ${CMAKE_BINARY_DIR}/CRT/COFF/crtbegin.o" CACHE INTERNAL "objects to get first include in every link in coff" FORCE)
set(SHIRO_CXX_POSTOBJECTS_COFF "${CMAKE_BINARY_DIR}/CRT/COFF/crtend.o ${CMAKE_BINARY_DIR}/CRT/COFF/crtn.o" CACHE INTERNAL "objects to get last include in every link in coff" FORCE)

set(SHIRO_MIN_PREOBJECTS_ELF "${CMAKE_BINARY_DIR}/CRT/MIN_ELF/crt0.o" CACHE INTERNAL "objects to get first include in every link in elf" FORCE)
set(SHIRO_MIN_PREOBJECTS_COFF "${CMAKE_BINARY_DIR}/CRT/MIN_COFF/crt0.o" CACHE INTERNAL "objects to get first include in every link in coff" FORCE)

set(SHIRO_EFI_PREOBJECTS "${CMAKE_BINARY_DIR}/CRT/EFI/crtinit.o ${CMAKE_BINARY_DIR}/CRT/EFI/crtexit.o" CACHE INTERNAL "objects to get first include in every link in efi" FORCE)