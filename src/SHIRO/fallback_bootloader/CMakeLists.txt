cmake_minimum_required(VERSION 3.29 FATAL_ERROR)

include(../../../cmake/common.cmake)
include(../../../cmake/toolchains/standalone.cmake)
include(../../../cmake/toolchains/efi.cmake)

project(
        SHIRO_FALLBACK_BOOTLOADER
        VERSION 0.1.0
        DESCRIPTION "A bootloader for x86_64 UEFI"
        LANGUAGES ASM_NASM
)

set(PROJECT_VERSION "${SHIRO_VERSION}_${PROJECT_VERSION}")

set_output("${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/BOOT")
add_executable(BOOTX64
        fallback.asm
)