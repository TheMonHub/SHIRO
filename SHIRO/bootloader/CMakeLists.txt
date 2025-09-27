# No config

# This project will return these cmake cache variable:
# ${KURO_CRTA} C runtime for efi. Put before any other object file when linking.
# ${KURO_CRTZ} Put this after every object file.
# ${KURO_CLIB} C library for efi.
# ${KURO_MAIN_BIN} Bootloader binary (KUROX64.EFI)
# ${KURO_SHIM_BIN} Shim loader binary (BOOTX64.EFI)

cmake_minimum_required(VERSION 3.29 FATAL_ERROR)

project(KURO
        DESCRIPTION "A bootloader for x86_64 UEFI to go with SHIRO"
        HOMEPAGE_URL "https://github.com/TheMonHub/SHIRO"
        LANGUAGES C CXX ASM_NASM
)

include(cmake/toolchain.cmake)

set(KURO_INCLUDE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include CACHE INTERNAL "Include directory for KURO" FORCE)

add_subdirectory(src/crt)
add_subdirectory(src/bootloader)