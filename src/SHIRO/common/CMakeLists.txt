cmake_minimum_required(VERSION 3.29 FATAL_ERROR)

set(SHIRO_PARENT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
include(${SHIRO_PARENT_DIR}/cmake/common.cmake)
include(${SHIRO_PARENT_DIR}/cmake/toolchains/standalone.cmake)

project(
        SHIRO_COMMON
        VERSION 0.1.0
        DESCRIPTION "SHIRO Common Constants, Headers and Utilities"
        LANGUAGES CXX ASM_NASM
)

set(PROJECT_VERSION "${SHIRO_VERSION}_${PROJECT_VERSION}")

set_output_arc("${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/common")
add_library(SHIRO_COMMON STATIC
        common_string.cpp
)