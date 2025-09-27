## About this repository

---

This repository contains the source code for SHIRO. including the kernel, bootloader, and userspace.

---

### Project Structure

| Directory/File      | Description                                                                                         |
|---------------------|-----------------------------------------------------------------------------------------------------|
| `automated/`        | Automated scripts.                                                                                  |
| `SHIRO/`            | Collection of SHIRO subprojects.                                                                    |
| `SHIRO/docs/`       | Documentation files for this Repository                                                             |
| `SHIRO/kernel/`     | The [kernel source code](../kernel)                                                                 |
| `SHIRO/bootloader/` | The [bootloader source code](../bootloader)                                                         |
| `SHIRO/userspace/`  | The [userspace source code](../userspace)                                                           |
| `CMakeLists.txt`    | The [CMakeLists.txt](../../CMakeLists.txt) used to batch all the subprojects to be build in one go. |

inside each source code directory, there are `CMakeLists.txt` files that define the build system.
and `README.md` files that describe the components and how to build them.

### Source code Directory Structure

| Directory/File          | Description                                                                                            |
|-------------------------|--------------------------------------------------------------------------------------------------------|
| `src/`                  | The source codes of the project.                                                                       |
| `include/`              | The headers for the project.                                                                           |
| `cmake/`                | The files used in cmake build system.                                                                  |
| `cmake/toolchain.cmake` | The toolchain file to be used in the project. **DO NOT MANUALLY ADD IT UNDER ANY NORMAL CIRCUMSTANCE** |
| `automated/`            | The scripts used to automated things. Must include the root automated scripts.                         |
| `docs/`                 | The documentation for the project.                                                                     |

### CMakeLists.txt

inside the CMakeLists.txt at the top will contain available configuration options and return variables.

**Configuration options** are variables that can be set in the CMakeLists.txt to change the build system behavior. set
this with command line arguments.

**Return variables** are cached variables that will be set after the CMakeLists.txt is configured. Typical use cases for
these are to get an output such as binary of a specific thing (e.g., `bootloader binary`) after you add_subdirectory()
the CMakeLists.txt.

For example, you add_subdirectory() the bootloader CMakeLists.txt, and then you can use
`${KURO_MAIN_BIN}` to get the bootloader binary. this is useful for automatically setting up an environment like putting
bootloader binary in EFI/BOOT/BOOTX64.EFI or other deployment.