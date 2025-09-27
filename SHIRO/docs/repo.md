## About this repository

---

This repository contains the source code for SHIRO. including the kernel, bootloader, and userspace.

---

### Project File Structure

| Directory/File      | Description                                                                                  |
|---------------------|----------------------------------------------------------------------------------------------|
| `automated/`        | Automated scripts.                                                                           |
| `SHIRO/`            | Contains the source code for SHIRO’s kernel, bootloader, and userspace subprojects.          |
| `SHIRO/docs/`       | Documentation files for this Repository                                                      |
| `SHIRO/kernel/`     | The [kernel subproject](../kernel)                                                           |
| `SHIRO/bootloader/` | The [bootloader subproject](../bootloader)                                                   |
| `SHIRO/userspace/`  | The [userspace subproject](../userspace)                                                     |
| `CMakeLists.txt`    | Top-level [CMakeLists.txt](../../CMakeLists.txt) that builds all SHIRO subprojects together. |

inside each source code directory, there are `CMakeLists.txt` files that define the build system.
and `README.md` files that describe the components and how to build them.

### Subproject Directory Structure

| Directory/File          | Description                                                                                                                                                                           |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `src/`                  | The source code of the project. Each directory inside `src/` contain a component                                                                                                      |
| `include/`              | The headers for the project.                                                                                                                                                          |
| `cmake/`                | The files used in cmake build system.                                                                                                                                                 |
| `cmake/toolchain.cmake` | The toolchain file to be used in the project. **DO NOT MANUALLY ADD IT UNDER ANY NORMAL CIRCUMSTANCE**                                                                                |
| `automated/`            | The scripts used to automated things. Must include the [clang-format](../../automated/clang-format.sh) / [clang-tidy](../../automated/clang-tidy.sh) automated scripts from the root. |
| `docs/`                 | The documentation for the project.                                                                                                                                                    |

---

### CMakeLists.txt

inside the CMakeLists.txt at the top will contain available configuration options and return variables.

**Configuration options** are variables that can be set in the CMakeLists.txt to change the build system behavior. set
this with command line arguments.

**Return variables** are cached variables that will be set after the CMakeLists.txt is configured. Typical use cases for
these are to get an output such as binary of a specific thing (e.g., `bootloader binary`) after you add_subdirectory()
the CMakeLists.txt.

For example, After adding a subdirectory via add_subdirectory(), CMake can expose variables (like ${KURO_MAIN_BIN})
containing outputs such as binaries. This is useful for deployment, e.g., copying the bootloader binary to
EFI/BOOT/BOOTX64.EFI.

---

### SHIRO Subprojects

SHIRO is made up of multiple subprojects that are built together to form the final product. Operating system in this
case.

#### Execution / Dependency order

```

+-----------------+
| KURO bootloader |
+-----------------+
         ↓
+-----------------+
|  SHIRO kernel   |
+-----------------+
         ↓
+-----------------+
|  AOI userspace  |
+-----------------+

```

#### Subprojects

The components/subprojects of SHIRO are:

1. SHIRO kernel
2. KURO bootloader
    - a main bootloader that boots the kernel.
    - shim loader that loads the main bootloader, acting like a symlink.
3. AOI userspace
    - built-in application that made up the final operating system. (e.g., shell, window compositor, service/daemon,
      drivers, etc.).