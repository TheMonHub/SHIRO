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
// Created by Mono on 26/8/25.
//

#include "../../../include/SHIRO/common/common_string.h"

#include <stdint.h>

static const char16_t kHelloWorld16[] = u"Hello, world!";
static const char16_t kNewLine16[] = u"\r\n";

extern "C" const uint16_t *utf16_common_hello_world =
    reinterpret_cast<const uint16_t *>(kHelloWorld16);

extern "C" const uint16_t *utf16_common_newline =
    reinterpret_cast<const uint16_t *>(kNewLine16);