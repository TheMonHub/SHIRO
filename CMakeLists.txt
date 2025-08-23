cmake_minimum_required(VERSION 3.29 FATAL_ERROR)
project(
        SHIRO
        VERSION 0.1.0
        DESCRIPTION "A bootloader, kernel, and operating system for x86_64 UEFI"
        LANGUAGES ASM_NASM C
)
include(cmake/common.cmake)
set(SHIRO_VERSION "${SHIRO_VERSION}_${PROJECT_VERSION}")

add_subdirectory(src/SHIRO/bootloader)
add_subdirectory(src/SHIRO/fallback_bootloader)