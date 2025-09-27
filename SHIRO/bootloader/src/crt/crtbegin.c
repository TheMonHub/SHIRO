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

#include "crt/crtbegin.h"

#include "crt/crti.h"
#include "crt/crtn.h"

void _init(void) {
  for (void (*const *init)(void) = __ctors_start + 1; init < __ctors_end;
       ++init) {
    (*init)();
  }
}