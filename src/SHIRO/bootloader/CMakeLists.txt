cmake_minimum_required(VERSION 3.29 FATAL_ERROR)

set(SHIRO_PARENT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
include(${SHIRO_PARENT_DIR}/cmake/common.cmake)
include(${SHIRO_PARENT_DIR}/cmake/toolchains/standalone.cmake)
include(${SHIRO_PARENT_DIR}/cmake/toolchains/coff.cmake)
include(${SHIRO_PARENT_DIR}/cmake/toolchains/efi.cmake)

project(
        SHIRO_BOOTLOADER
        VERSION 0.1.0
        DESCRIPTION "A bootloader for SHIRO x86_64 UEFI"
        LANGUAGES ASM_NASM
)

find_program(QEMU NAMES qemu-system-x86_64)
set(OVMF_DIR "/usr/share/edk2/x64" CACHE PATH "Path to OVMF files")

set(PROJECT_VERSION "${SHIRO_VERSION}_${PROJECT_VERSION}")

set_output_run("${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/SHIRO")
add_executable(SHIROX64
        bootloader.asm
)

if (QEMU)
    message(STATUS "QEMU found: ${QEMU}")
    message(NOTICE "Please ensure that the OVMF_DIR variable is set correctly.")
    message(STATUS "OVMF directory: ${OVMF_DIR}")
    configure_file(
            ${CMAKE_CURRENT_SOURCE_DIR}/run.sh.in
            ${CMAKE_BINARY_DIR}/run.sh
            @ONLY
    )
else ()
    message(WARNING "QEMU not found, skipping run.sh generation.")
endif ()