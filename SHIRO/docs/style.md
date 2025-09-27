### File and Naming Conventions

---

To maintain consistency and readability across the SHIRO codebase, please adhere to the following conventions:

* **File Naming:** All source and header files (`.hpp`, `.cpp`, `.h`, `.c`) must use **`snake_case`** for their names (
  e.g., `my_awesome_module.hpp`, `bootloader.cpp`).

* **File Headers (Copyright & License):** Every new or modified source file must begin with the standard SHIRO
  copyright and license header. Please ensure the year is current.

    ```cpp
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
    // Created by Mono on DAY/MONTH/YEAR.
    //
    ```
  *Note: The "Created by" line is primarily for your internal tracking or IDE integration and isn't strictly required.*

* **Header Guards:** To prevent multiple inclusions, all header files (`.hpp`) must use include guards. The naming
  convention for these guards should follow the pattern:
  `SHIRO__FILENAME`

    * **Structure:** `SHIRO_` (project prefix) `FILENAME_` (snake_case filename)
      `EXTENSION` (e.g., `H`, `HPP`)

    * **Example for `common.h`:**
        ```cpp
        #ifndef SHIRO_COMMON_H
        #define SHIRO_COMMON_H

        // ... file content ...

        #endif // SHIRO_COMMON_H
        ```
  This convention ensures uniqueness across your project and clearly indicates the file's location within the framework
  structure.
* **Required Guard:** All header files that are C header files (`.h`) must include the following guard:
    ```cpp                 
  // ... header guards ...
  
  #ifdef __cplusplus
  extern "C" {
  #endif 
  
  // ... file content ...
  
  #ifdef __cplusplus
  } 
  #endif 
  
  // ... header guards ...
  ```
  This ensures that C header files can be included in C++ code without causing any complications or work from the C++
  side.

* **Commenting:** Do not be afraid to comment. Comments are a great way to explain your code and help others understand
  your code. Comments should be in a place where they are useful and not redundant. **Do not** comment self-explanatory
  code. You can feel free to comment on anything but keep it concise and not cluttered. This includes but is not limited
  to:
    * explain why a particular piece of code is written the way it is.
    * breakdown and explain how certain parts of the code work.
    * personal notes and thoughts.
        * *NOTE: Please ensure your comments are complying with [CODE OF CONDUCT](CODE_OF_CONDUCT.md) and are
          appropriate
          for the project. Avoid discriminatory or offensive comments.*

* **Naming Conventions:** We adhere strictly to The *Google C++ Style Guide*, Please refer to
  the [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html) for more details.
    * Function names should be in `PascalCase` (e.g., `MyAwesomeFunction`).
      under any normal circumstances. An exception to this rule is when the function is a getter or setter. In this
      case, the function name should be in
      `snake_case` (e.g., `get_my_awesome_variable`).

**IMPORTANT:** Clang-tidy does not automatically check function names.