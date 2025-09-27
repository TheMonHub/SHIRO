cmake_minimum_required(VERSION 3.29)

project(SHIRO
        DESCRIPTION "An Operating system for x86_64 UEFI Aiming to be flexible and user-friendly"
        HOMEPAGE_URL "https://github.com/TheMonHub/SHIRO"
)

add_subdirectory(SHIRO/bootloader)
add_subdirectory(SHIRO/kernel)
add_subdirectory(SHIRO/userspace)