# No config

# This project will return these cmake cache variable:
# ${KURO_CRTA} C runtime for efi. Put before any other object file when linking.
# ${KURO_CRTZ} Put this after every object file.

project(KURO_CRT
        VERSION 1.0.0
        DESCRIPTION "A C runtime to go with x86_64 UEFI"
        HOMEPAGE_URL "https://github.com/TheMonHub/SHIRO"
        LANGUAGES ASM_NASM C
)

add_library(KURO_CRT_A STATIC crtbegin.c crt1.c)
add_library(KURO_CRT_Z STATIC crtend.c)
target_include_directories(KURO_CRT_A PUBLIC ${KURO_INCLUDE_DIRECTORY})
target_include_directories(KURO_CRT_Z PUBLIC ${KURO_INCLUDE_DIRECTORY})

set(KURO_CRTA "${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/efi_KURO_CRT_A.a" CACHE INTERNAL "C runtime for UEFI (start)" FORCE)
set(KURO_CRTZ "${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/efi_KURO_CRT_Z.a" CACHE INTERNAL "C runtime for UEFI (end)" FORCE)