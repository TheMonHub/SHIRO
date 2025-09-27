## SHIRO PROJECT: An Open source operating system for x86_64 UEFI

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)
[![GitHub license](https://img.shields.io/github/license/TheMonHub/SHIRO.svg)](LICENSE)

SHIRO is an open-source operating system for x86_64 UEFI. Aiming to be flexible, and user-friendly.

---

### Quick Start Guide

To build SHIRO, you will (probably) need the following tools — most are required, some are optional depending on what
you want to do.

* **Compiler:**
    * **Clang / Clang++:** LLVM/Clang 17.0 or newer for building C and C++
    * **NASM:** Latest stable version.
* **CMake:** Version 3.29 or newer.
* **Git:** Latest stable version.
* **Clang-Format & Clang-Tidy:** Ensure these are installed and in your PATH for the formatting and static analysis
  scripts to work correctly, LLVM version 17 recommended. (Optional if you’re not planning to contribute.)
* **Bash:** Required for automated scripts. On Windows, use [WSL](https://learn.microsoft.com/windows/wsl/install)
* **QEMU / OVMF:** Required for running the kernel in an emulated
  environment. [How to set up OVMF for QEMU.](https://wiki.archlinux.org/title/QEMU#Booting_in_UEFI_mode) (Optional if
  you plan to run SHIRO on real hardware.)

Please **ensure** your development environment is set up according to these requirements.

**We do not** support compilers other than Clang/Clang++ and NASM. So please don't waste your time trying to build SHIRO
with other compilers like GCC and MSVC.

**DO NOT** build the subprojects under src/ directly.
Instead, use the top-level CMakeLists.txt (or the one inside each subproject folder if you’re working on it as
standalone). Not doing so will cause the build to fail because there are dependencies between the components both
explicit and implicit

For more information on the project structure, see [Repository Structure](SHIRO/docs/repo.md).

---

### Contributing

Did you know? Contributors are welcome! — I promise I won’t bite! Any kind of contribution is appreciated
See [CONTRIBUTING](CONTRIBUTING.md) for details on how to contribute to SHIRO.