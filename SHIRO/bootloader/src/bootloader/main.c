// SHIRO project, an operating system, kernel and bootloader.
// Copyright (C) 2025 TheMonHub
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

//
// Created by Mono on 27/9/25.
//
#include "efi/types.h"

int main(EFI_HANDLE ImageHandle, const EFI_SYSTEM_TABLE *SystemTable) {
  CHAR16 hello[] = {'H', 'e', 'l', 'l', 'o', ',',  ' ',  'W',
                    'o', 'r', 'l', 'd', '!', '\r', '\n', 0};
  SystemTable->ConOut->OutputString(SystemTable->ConOut, hello);
  return 0;
}