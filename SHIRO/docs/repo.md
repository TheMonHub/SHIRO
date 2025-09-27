### About this repository

---

This repository contains the source code for SHIRO. including the kernel, bootloader, and userspace.

---

### Project Structure

| Directory           | Description                                                                                         |
|---------------------|-----------------------------------------------------------------------------------------------------|
| `automated/`        | Automated scripts.                                                                                  |
| `SHIRO/`            | Collection of SHIRO subprojects.                                                                    |
| `SHIRO/docs/`       | Documentation files. containing Markdown files.                                                     |
| `SHIRO/kernel/`     | The [kernel source code](../kernel)                                                                 |
| `SHIRO/bootloader/` | The [bootloader source code](../bootloader)                                                         |
| `SHIRO/userspace/`  | The [userspace source code](../userspace)                                                           |
| `CMakeLists.txt`    | The [CMakeLists.txt](../../CMakeLists.txt) used to batch all the subprojects to be build in one go. |

inside each source code directory, there are `CMakeLists.txt` files that define the build system.
and `README.md` files that describe the components and how to build them.

### Source code Directory Structure

| Directory    | Description                                                                    |
|--------------|--------------------------------------------------------------------------------|
| `src/`       | The source codes of the project                                                |
| `include/`   | The headers for the project                                                    |
| `cmake/`     | The files used in cmake build system                                           |
| `automated/` | The scripts used to automated things. Must include the root automated scripts. |