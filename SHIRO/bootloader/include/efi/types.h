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
#ifndef SHIRO_TYPES_H
#define SHIRO_TYPES_H
#ifdef __cplusplus
extern "C" {
#endif

#include "stdint.h"

#define EFIAPI __attribute__((ms_abi))

#define IN
#define OUT
#define OPTIONAL

typedef void* EFI_HANDLE;
typedef uint64_t UINTN;
typedef uint32_t UINT32;
typedef uint64_t UINT64;
typedef uint16_t CHAR16;
typedef UINTN EFI_STATUS;

typedef struct EFI_TABLE_HEADER {
  UINT64 Signature;
  UINT32 Revision;
  UINT32 HeaderSize;
  UINT32 CRC32;
  UINT32 Reserved;
} EFI_TABLE_HEADER;

struct EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL;
typedef struct _EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL;

typedef EFI_STATUS(EFIAPI* EFI_TEXT_STRING)(
    struct _EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL* This, CHAR16* String);

typedef struct _EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL {
  void* Reset;
  EFI_TEXT_STRING OutputString;
  void* TestString;
  void* QueryMode;
  void* SetMode;
  void* SetAttribute;
  void* ClearScreen;
  void* SetCursorPosition;
  void* EnableCursor;
  struct SIMPLE_TEXT_OUTPUT_MODE* Mode;
} EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL;

typedef struct EFI_SYSTEM_TABLE {
  EFI_TABLE_HEADER Hdr;
  CHAR16* FirmwareVendor;
  UINT32 FirmwareRevision;
  EFI_HANDLE ConsoleInHandle;
  struct EFI_SIMPLE_TEXT_INPUT_PROTOCOL* ConIn;
  EFI_HANDLE ConsoleOutHandle;
  EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL* ConOut;
  EFI_HANDLE StandardErrorHandle;
  struct EFI_RUNTIME_SERVICES* RuntimeServices;
  struct EFI_BOOT_SERVICES* BootServices;
  UINTN NumberOfTableEntries;
  struct EFI_CONFIGURATION_TABLE* ConfigurationTable;
} EFI_SYSTEM_TABLE;

#ifdef __cplusplus
}
#endif
#endif  // SHIRO_TYPES_H
