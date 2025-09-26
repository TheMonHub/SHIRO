#
# SHIRO project, an operating system, kernel and bootloader.
# Copyright (C) 2025 TheMonHub
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

# shellcheck disable=SC2046
cd ..
cmake -S . -B clang_tidy_build -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -G Ninja
cmake --build clang_tidy_build
# shellcheck disable=SC2046
run-clang-tidy '^(?!.*(\.asm|\.inc|_deps/))' -p build -quiet