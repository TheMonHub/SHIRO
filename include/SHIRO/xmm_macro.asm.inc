; SHIRO project, an operating system, kernel and bootloader.
; Copyright (C) 2025 TheMonHub
;
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <https://www.gnu.org/licenses/>.

%macro PUSHXMM 1
  sub rsp, 16
  movdqu [rsp], %1
%endmacro

%macro POPXMM 1
  movdqu %1, [rsp]
  add rsp, 16
%endmacro