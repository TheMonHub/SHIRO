cmake_minimum_required(VERSION 4.0)
project(
        ShiroOS
        VERSION 0.1.0
        DESCRIPTION "A bootloader, kernel, and operating system for x86_64"
        LANGUAGES ASM_NASM
)

set(SHIRO_BOOTLOADER_SOURCE ${CMAKE_SOURCE_DIR}/src/bootloader/bootloader.asm)

add_custom_command(
        OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/bootloader
        COMMAND ${CMAKE_ASM_NASM_COMPILER} -f win64 ${SHIRO_BOOTLOADER_SOURCE} -o ${CMAKE_CURRENT_BINARY_DIR}/bootloader.efi
        COMMENT "Building bootloader"
)

add_custom_target(run
        DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/bootloader.efi
        COMMAND cp /usr/share/edk2/x64/OVMF_VARS.4m.fd ./
        COMMAND "qemu-system-x86_64 -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2/x64/OVMF_CODE.4m.fd
                -drive if=pflash,format=raw,file=./OVMF_VARS.4m.fd -hda bootloader.img"
        COMMENT "Running OS in QEMU"
)

add_custom_target(untitledOS ALL DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/bootloader)