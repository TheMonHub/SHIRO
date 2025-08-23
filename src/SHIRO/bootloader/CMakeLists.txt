cmake_minimum_required(VERSION 3.29 FATAL_ERROR)

include(../../../cmake/common.cmake)
include(../../../cmake/toolchains/standalone.cmake)
include(../../../cmake/toolchains/efi.cmake)

project(
        SHIRO_BOOTLOADER
        VERSION 0.1.0
        DESCRIPTION "A bootloader for x86_64 UEFI"
        LANGUAGES ASM_NASM
)

set(SHIRO_BOOTLOADER_VERSION "${SHIRO_VERSION}_${SHIRO_BOOTLOADER_VERSION}")

add_executable(bootloader
    bootloader.asm
)