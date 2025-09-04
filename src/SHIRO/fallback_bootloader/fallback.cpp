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

class hello {
 public:
  hello() { int const i = 1; }
  ~hello() { int const i = 1; }
};

hello test;

extern "C" void atexit(void (*func)(void));

void nothing() { return; }

int something(int a, int b, int c) {
  int x = ++a;
  const int y = ++b;
  const int z = ++c;
  x += y + z;
  atexit(nothing);
  return x;
}

int main(const int a, const int b, const int c) { return something(a, b, c); }