cmake_minimum_required(VERSION 3.29 FATAL_ERROR)

set(SHIRO_PARENT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
include(${SHIRO_PARENT_DIR}/cmake/common.cmake)
include(${SHIRO_PARENT_DIR}/cmake/toolchains/standalone.cmake)
include(${SHIRO_PARENT_DIR}/cmake/toolchains/efi.cmake)

project(
        SHIRO_FALLBACK_BOOTLOADER
        VERSION 0.1.0
        DESCRIPTION "A shim bootloader for x86_64 UEFI"
        LANGUAGES ASM_NASM
)

set(PROJECT_VERSION "${SHIRO_VERSION}_${PROJECT_VERSION}")

set_output_run("${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/BOOT")
add_executable(BOOTX64
        fallback.c
)
target_link_libraries(BOOTX64 PRIVATE SHIRO_EFI_COMMON)