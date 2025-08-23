# shellcheck disable=SC2164
sh -c "[ -f test/OVMF_VARS.4m.fd ] || cp /usr/share/edk2/x64/OVMF_VARS.4m.fd ./"
mkdir -p test/drive/EFI/BOOT
mkdir -p test/drive/EFI/SHIRO
cp build/fallback.efi test/drive/EFI/BOOT/BOOTX64.EFI
cp build/bootloader.efi test/drive/EFI/SHIRO/SHIROX64.EFI
qemu-system-x86_64 -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2/x64/OVMF_CODE.4m.fd -drive if=pflash,format=raw,file=./OVMF_VARS.4m.fd -drive format=raw,file=fat:rw:drive/