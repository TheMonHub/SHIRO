cmake_minimum_required(VERSION 4.0)
project(
        ShiroOS
        VERSION 0.1.0
        DESCRIPTION "A bootloader, kernel, and operating system for x86_64"
        LANGUAGES ASM_NASM C
)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

set(SHIRO_BOOTLOADER_SOURCE ${CMAKE_SOURCE_DIR}/src/bootloader/bootloader.asm)
set(SHIRO_BOOTLOADER_FALLBACK_SOURCE ${CMAKE_SOURCE_DIR}/src/bootloader/fallback.asm)
find_program(LINKER NAMES lld REQUIRED)
find_program(QEMU NAMES qemu-system-x86_64 REQUIRED)
find_program(QEMU_IMAGE NAMES qemu-img REQUIRED)

add_custom_target(bootloader ALL
        COMMAND ${CMAKE_ASM_NASM_COMPILER} -f win64 ${SHIRO_BOOTLOADER_SOURCE} -o ${CMAKE_CURRENT_BINARY_DIR}/bootloader.o
        COMMAND ${CMAKE_ASM_NASM_COMPILER} -f win64 ${SHIRO_BOOTLOADER_FALLBACK_SOURCE} -o ${CMAKE_CURRENT_BINARY_DIR}/fallback.o
        COMMAND ${LINKER} -flavor link -subsystem:efi_application -entry:_start -out:bootloader.efi bootloader.o
        COMMAND ${LINKER} -flavor link -subsystem:efi_application -entry:_start -out:fallback.efi fallback.o
        COMMENT "Building bootloader"
)

add_custom_target(run
        DEPENDS /usr/share/edk2/x64/OVMF_VARS.4m.fd /usr/share/edk2/x64/OVMF_CODE.4m.fd
        COMMAND sh -c "[ -f ./OVMF_VARS.4m.fd ] || cp /usr/share/edk2/x64/OVMF_VARS.4m.fd ./"
        COMMAND mkdir -p drive/EFI/BOOT
        COMMAND mkdir -p drive/EFI/SHIRO
        COMMAND cp ${CMAKE_CURRENT_BINARY_DIR}/fallback.efi drive/EFI/BOOT/BOOTX64.EFI
        COMMAND cp ${CMAKE_CURRENT_BINARY_DIR}/bootloader.efi drive/EFI/SHIRO/SHIROX64.EFI
        COMMAND mkdir -p drive/SHIRO/drivers/file_system
        COMMAND ${QEMU} -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2/x64/OVMF_CODE.4m.fd -drive if=pflash,format=raw,file=./OVMF_VARS.4m.fd -drive format=raw,file=fat:rw:drive/
        COMMENT "Running OS in QEMU"
)
add_dependencies(run bootloader)