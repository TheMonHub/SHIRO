cmake_minimum_required(VERSION 3.29 FATAL_ERROR)
project(
        SHIRO
        VERSION 0.1.0
        DESCRIPTION "A bootloader, kernel, and operating system for x86_64 UEFI"
        LANGUAGES ASM_NASM C
)
set(SHIRO_PARENT_DIR ${CMAKE_CURRENT_SOURCE_DIR})
include(cmake/common.cmake)

set(SHIRO_VERSION "${PROJECT_VERSION}") # incase it didn't work with the cached variable
set(SHIRO_VERSION "${PROJECT_VERSION}" CACHE INTERNAL "SHIRO version")

add_subdirectory(src/SHIRO/crt)
add_subdirectory(src/SHIRO/common)
add_subdirectory(src/SHIRO/bootloader)
add_subdirectory(src/SHIRO/fallback_bootloader)

# TODO: Save registers as the initialization code gets called in CRT
# FIXME: Fix the undefined symbol: __main issue
# TODO: Review the initialization code for any logical errors IMPORTANT because I think I might mess something up!!