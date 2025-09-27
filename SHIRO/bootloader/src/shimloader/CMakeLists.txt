# No config

# ${KURO_SHIM_BIN} Shim loader binary (BOOTX64.EFI)

project(KURO_BOOTLOADER
        DESCRIPTION "A shim loader for x86_64 UEFI to go with any efi application"
        HOMEPAGE_URL "https://github.com/TheMonHub/SHIRO"
        LANGUAGES C
)

add_executable(BOOTX64 main.c)
target_include_directories(BOOTX64 PUBLIC ${KURO_INCLUDE_DIRECTORY})

set(KURO_SHIM_BIN "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/BOOTX64.EFI" CACHE INTERNAL "Main KURO bootloader binary" FORCE)