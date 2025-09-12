cmake_minimum_required(VERSION 3.29 FATAL_ERROR)

set(SHIRO_PARENT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
include(${SHIRO_PARENT_DIR}/cmake/common.cmake)
include(${SHIRO_PARENT_DIR}/cmake/toolchains/standalone.cmake)

project(
        SHIRO_LIBC
        VERSION 0.1.0
        DESCRIPTION "SHIRO C Library for Freestanding x86_64"
        LANGUAGES ASM_NASM
)

include(${SHIRO_PARENT_DIR}/cmake/toolchains/coff.cmake)

add_library()

include(${SHIRO_PARENT_DIR}/cmake/toolchains/elf.cmake)