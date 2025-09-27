# No config

# ${KURO_MAIN_BIN} Bootloader binary (KUROX64.EFI)

project(KURO_BOOTLOADER
        DESCRIPTION "A bootloader for x86_64 UEFI to go with SHIRO"
        HOMEPAGE_URL "https://github.com/TheMonHub/SHIRO"
        LANGUAGES C
)

add_executable(KUROX64 main.c)
target_include_directories(KUROX64 PUBLIC ${KURO_INCLUDE_DIRECTORY})

set(KURO_MAIN_BIN "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/KUROX64.EFI" CACHE INTERNAL "Main KURO bootloader binary" FORCE)