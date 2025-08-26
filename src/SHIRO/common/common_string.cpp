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

#include "SHIRO/common/string/common_string.h"

#include <stdint.h>

static const char16_t kHelloWorld_16[] = u"Hello, world!";
static const char16_t kNewLine16[] = u"\r\n";

extern "C" const uint16_t *g_common_hello_world_16 =
    reinterpret_cast<const uint16_t *>(kHelloWorld_16);

extern "C" const uint16_t *g_common_newline_16 =
    reinterpret_cast<const uint16_t *>(kNewLine16);