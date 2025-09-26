# Contributing to SHIRO

We're incredibly excited that you're interested in contributing to SHIRO\! Your contributions, whether big or
small, are vital to making SHIRO the best Operating system it can be.

This guide outlines how you can contribute, ensuring a smooth and efficient process for everyone involved.

-----

## Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in
this project, you agree to abide by its terms.

-----

## How to Contribute: Beyond Just Code

Contributing to SHIRO isn't just about writing code! There are many ways to help improve the project, whether
you're a seasoned developer or just starting out. Every contribution, no matter how small, is valuable.

### Different Ways to Contribute

#### 1\. Report Bugs and Issues

Found a bug? Encountered unexpected behavior? Your detailed reports are crucial for making SHIRO more stable and
reliable.

* **How to Report:** Please open a new [GitHub Issue](https://github.com/TheMonHub/SHIRO/issues/new/choose). We
  have templates to guide you.
* **What to Include:** Provide clear steps to reproduce the issue, what you expected to happen, what actually happened
  (including any error messages), and details about your environment (OS, compiler).

#### 2\. Suggest New Features or Enhancements

Have an idea to make SHIRO even better? We'd love to hear it!

* **How to Suggest:** Open a new [GitHub Issue](https://github.com/TheMonHub/SHIRO/issues/new/choose).
* **What to Include:** Clearly describe the problem your feature solves, propose how it might work (conceptual design,
  API ideas), and explain why it would be beneficial to SHIRO and its users.

#### 3\. Improve Documentation

Good documentation is key to a framework's usability. If something is unclear, incomplete, or missing, you can help! We
use Doxygen to generate our documentation.

* **How to Contribute:** This often involves submitting
  a [Pull Request](https://github.com/TheMonHub/SHIRO/pulls) with your
  proposed changes. Since we use Doxygen, documentation comments primarily live within the **source code files**
  themselves (e.g., `.h`/`.hpp` headers, `.cppm` interface and `.cpp` implementation files). You can also improve
  standalone Markdown files like `README.md` or this `CONTRIBUTING.md`. Even small typos or clarity improvements are
  welcome.

#### 4\. Help with Testing and Feedback

As SHIRO evolves, rigorous testing is vital.

* **How to Contribute:** You can help by testing new features from `develop` branches, running existing examples, or
  simply trying to build SHIRO on different systems and reporting any issues. Share your experiences, successes,
  or challenges via [GitHub Issues](#1-report-bugs-and-issues) or our [Discord server](#need-help).

#### 5\. Provide Community Support

If you're familiar with SHIRO, you can help others!

* **How to Contribute:** Join our ~~[Discord server]()~~ and answer questions, provide
  guidance, or share solutions with fellow contributors and users. Helping others learn and succeed with SHIRO
  is a fantastic contribution.

#### 6\. Spread the Word

Help us grow the SHIRO community!

* **How to Contribute:** Share SHIRO on social media, write blog posts, create tutorials, or present it at
  meetups. Raising awareness helps us attract more users and contributors.

---

### Contributing Code (Technical Guide)

If you're ready to dive into the codebase and submit new features or bug fixes, this section is for you.

#### 1\. Fork the Repository

First, you'll need to fork the [SHIRO repository](https://github.com/TheMonHub/SHIRO) to your own GitHub
account. This creates a personal copy where you can make your changes.

#### 2\. Clone Your Fork

Clone your forked repository to your local machine:

```bash
git clone https://github.com/YourUsername/SHIRO.git
cd SHIRO
````

#### 3\. Development Environment Setup

To build and contribute to SHIRO, you will need:

* **Compiler:**
    * **Clang / Clang++:** LLVM/Clang 16.0 and newer for building C and C++
    * **NASM:** Lastest stable version.
* **CMake:** Version 3.28 or newer.
* **Git:** Latest stable version.
* **Clang-Format & Clang-Tidy:** Ensure these are installed and in your PATH for the formatting and static analysis
  scripts to work correctly, LLVM version 19 recommended.

Please ensure your development environment is set up according to these requirements.

#### 4\. File and Naming Conventions

To maintain consistency and readability across the SHIRO codebase, please adhere to the following conventions:

* **File Naming:** All source and header files (`.hpp`, `.cpp`, `.g`, `.c`) must use **`snake_case`** for their names (
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
      `EXTENSION` (e.g., `HPP`)

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

#### 5\. Gitflow Workflow

SHIRO uses the **Gitflow Workflow**. This means we primarily work with feature branches.

1. **Sync with `develop`:** Ensure your local `develop` branch is up to date with the upstream `develop` branch:
   ```bash
   git checkout develop
   git pull upstream develop
   ```
   If you haven't set up the `upstream` remote yet, you can do so with:
   ```bash
   git remote add upstream https://github.com/TheMonHub/SHIRO.git
   ```
2. **Create a Feature Branch:** Based on `develop`, create a new feature branch for your changes. Use a descriptive
   name (e.g., `feature/add-new-widget`, `bugfix/fix-memory-leak`).
   ```bash
   git checkout -b feature/your-feature-name develop
   ```
3. **Make Your Changes:** Implement your bug fix or feature.

**IMPORTANT:** It is recommended to use gitflow extensions for Git to manage your branches and releases more easily. If
you haven't set up gitflow yet, you can do so by following the instructions in
the [gitflow documentation](https://github.com/nvie/gitflow)

**NOTE:** For more details on the Gitflow Workflow, refer to
the [Gitflow](https://nvie.com/posts/a-successful-git-branching-model/).

#### 6\. Build the Project

SHIRO uses CMake for its build system. The primary build instructions are detailed directly within
the [CMakeLists.txt](CMakeLists.txt) file at the root of the project.

In short, a typical build process involves:

```bash
mkdir build
cd build
cmake ..
cmake --build .
```

Refer to the top of `CMakeLists.txt` for the most accurate and up-to-date build instructions, including any specific
platform requirements or configuration options.

#### 7\. Format Your Code (Crucial\!)

SHIRO enforces strict code formatting using Clang-Format. **We adhere strictly to
the [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html).**

**Before committing**, always run the formatting script to ensure your code adheres to our style guidelines:

```bash
./automated/clang-format-fix.sh
```

This script will automatically reformat your code in place.

To only check the formatting without making changes, you can use:

```bash
./automated/clang-format.sh
```

#### 8\. Run Static Analysis (Important\!)

We use Clang-Tidy for static analysis to catch potential bugs and enforce coding standards. **Before committing**, run
the Clang-Tidy script:

```bash
./automated/clang-tidy.sh
```

**Note:** This script will build the project under the `build` directory as part of its execution. Review any warnings
or errors reported by Clang-Tidy and address them before pushing.

To fix issues reported by Clang-Tidy automatically, you can use the `-fix` script:

```bash
./automated/clang-tidy-fix.sh
```

#### 9\. Commit Your Changes

Once your changes are complete, formatted, analyzed, and tested, commit them to your feature branch. Write clear and
concise commit messages.

Use a clear and concise message prefixed with a type:

* `feat`: For new features.
* `fix`: For bug fixes.
* `docs`: For documentation changes.
* `style`: For formatting or non-functional code changes.
* `refactor`: For code refactoring.
* `chore`: For maintenance tasks, build process changes, etc.
* `perf`: For performance improvements.

<!-- end list -->

```bash
git add .

git commit -m "feat: Add new awesome widget"
```

#### 10\. Push Your Feature Branch

Push your feature branch to your forked repository on GitHub:

```bash
git push origin feature/your-feature-name
```

#### 11\. Create a Pull Request (PR)

Before submitting your PR, please ensure:

* Your code is formatted (`./automated/clang-format-fix.sh`).
* Clang-Tidy reports no major warnings (`./automated/clang-tidy.sh`).
* All existing tests pass, and new tests are added for new features/fixes.
* Your commit messages follow the Conventional Commits guidelines.
* You have read through your changes one last time, as if you were reviewing someone else's code.

<!-- end list -->

1. Go to your forked repository on GitHub.
2. GitHub will usually show a banner prompting you to create a pull request from your recently pushed branch. If not,
   navigate to the "Pull requests" tab and click "New pull request."
3. **Ensure the base branch is `develop` on the `TheMonHub/SHIRO` repository, and the compare branch is
   your `feature/your-feature-name` on your fork.**
4. Provide a clear and descriptive title and description for your pull request.
    * Explain what problem it solves or what feature it adds.
    * Reference any related issues (e.g., `Closes #123`, `Fixes #456`).
5. Submit the pull request.

#### 12\. Code Review

Maintainers will review your pull request. Be prepared to:

* Address any feedback or questions.
* Make further commits to your branch if necessary (these will automatically update the PR).
* Ensure all CI checks (build, format, static analysis, tests, etc.) pass on your PR.

Once your PR is approved and all checks pass, it will be merged into the `develop` branch.

## Need Help?

If you get stuck or have questions about contributing, feel free to:

* Open an [issue](https://github.com/TheMonHub/SHIRO/issues) on GitHub.
* ~~[Join our Discord server]()~~

-----

Thank you for contributing to SHIRO\! We appreciate your efforts in making this project better.
