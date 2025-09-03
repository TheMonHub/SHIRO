cmake_minimum_required(VERSION 3.29 FATAL_ERROR)

set(SHIRO_PARENT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
include(${SHIRO_PARENT_DIR}/cmake/common.cmake)
include(${SHIRO_PARENT_DIR}/cmake/toolchains/standalone.cmake)
include(${SHIRO_PARENT_DIR}/cmake/toolchains/efi.cmake)

project(
        SHIRO_EFI_COMMON
        VERSION 0.1.0
        DESCRIPTION "SHIRO Common Constants, Headers and Utilities for UEFI"
        LANGUAGES CXX
)

set(PROJECT_VERSION "${SHIRO_VERSION}_${PROJECT_VERSION}")

set_output_arc("${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/common")
add_library(SHIRO_EFI_COMMON STATIC
        common_string.cpp
)