## Contributing to SHIRO

We're incredibly excited that you're interested in contributing to SHIRO! Your contributions, whether big or
small, are vital to making SHIRO the best Operating system it can become.

This guide outlines how you can contribute, ensuring a smooth and efficient process for everyone involved.

-----

## Table of Contents

1. [Code of Conduct](#code-of-conduct)
2. [How to Contribute: Beyond Just Code](#how-to-contribute-beyond-just-code)
    1. [Different Ways to Contribute](#different-ways-to-contribute)
    2. [Contributing Code (Technical Guide)](#contributing-code-technical-guide)
        1. [1. Fork the Repository](#1-fork-the-repository)
        2. [2. Clone Your Fork](#2-clone-your-fork)
        3. [3. Development Environment Setup](#3-development-environment-setup)
        4. [4. File and Naming Conventions](#4-file-and-naming-conventions)
        5. [5. Gitflow Workflow](#5-gitflow-workflow)
            1. [5.1. Manual Workflow](#51-manual-workflow)
            2. [5.2. Gitflow Workflow](#52-gitflow-workflow)
        6. [6. Build the Project](#6-build-the-project)
        7. [7. Format Your Code (Crucial!)](#7-format-your-code-crucial)
        8. [8. Run Static Analysis (Important!)](#8-run-static-analysis-important)
        9. [9. Commit Your Changes](#9-commit-your-changes)
        10. [10. Push Your Feature Branch](#10-push-your-feature-branch)
        11. [11. Create a Pull Request (PR)](#11-create-a-pull-request-pr)
        12. [12. Code Review](#12-code-review)
3. [Need Help?](#need-help)

-----

## Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in
this project, you agree to abide by its terms.

-----

## How to Contribute: Beyond Just Code

Contributing to SHIRO isn't just about writing code! There are many ways to help improve the project, whether
you're a seasoned developer or just starting out. Every contribution, no matter how small, is valuable.

### Different Ways to Contribute

#### 1. Report Bugs and Issues

Found a bug? Encountered unexpected behavior? Your detailed reports are crucial for making SHIRO more stable and
reliable.

* **How to Report:** Please open a new [GitHub Issue](https://github.com/TheMonHub/SHIRO/issues/new/choose). We
  have templates to guide you.
* **What to Include:** Provide clear steps to reproduce the issue, what you expected to happen, what actually happened
  (including any error messages), and details about your environment (OS, version, compiler).

#### 2. Suggest New Features or Enhancements

Have an idea to make SHIRO even better? We'd love to hear it!

* **How to Suggest:** Open a new [GitHub Issue](https://github.com/TheMonHub/SHIRO/issues/new/choose).
* **What to Include:** Clearly describe the problem your feature solves, propose how it might work (conceptual design,
  API ideas), and explain why it would be beneficial to SHIRO and its users.

#### 3. Improve Documentation

Good documentation is key to a framework's usability. If something is unclear, incomplete, or missing, you can help! We
use Markdown for our documentation.

* **How to Contribute:** This often involves submitting
  a [Pull Request](https://github.com/TheMonHub/SHIRO/pulls) with your
  proposed changes. Since we use Markdown for documentation, you can find the source files in the
  [docs](SHIRO/docs) directory.

#### 4. Help with Testing and Feedback

As SHIRO evolves, rigorous testing is vital.

* **How to Contribute:** You can help by testing new features from `develop` branches, running existing examples, or
  simply trying to build SHIRO on different systems and reporting any issues. Share your experiences, successes,
  or challenges via [GitHub Issues](#1-report-bugs-and-issues).

#### 5. Provide Community Support

If you're familiar with SHIRO, you can help others!

* **How to Contribute:** Answer questions, provide guidance, or share solutions with fellow contributors and users.
  Helping others learn and succeed with SHIRO is a fantastic contribution.

#### 6. Spread the Word

Help us grow the SHIRO community!

* **How to Contribute:** Share SHIRO on social media, write blog posts, create tutorials, or present it at
  meetups. Raising awareness helps us attract more users and contributors.

---

### Contributing Code (Technical Guide)

If you're ready to dive into the codebase and submit new features or bug fixes, this section is for you.

**Also** read the documentation on [repository](SHIRO/docs/repo.md) for more information on the project
structure and how to build and run the project.

develop → feature → PR → develop

#### 1. Fork the Repository

First, you'll need to fork the [SHIRO repository](https://github.com/TheMonHub/SHIRO) to your own GitHub
account. This creates a personal copy where you can make your changes.

#### 2. Clone Your Fork

Clone your forked repository to your local machine:

```bash
git clone https://github.com/YourUsername/SHIRO.git
cd SHIRO
````

#### 3. Development Environment Setup

For development environment and requirements, please refer to the [README](README.md) Quick Start Guide.

#### 4. File and Naming Conventions

Please refer to the [Code Style Guide](SHIRO/docs/style.md) for more information on file and naming conventions.

#### 5. Gitflow Workflow

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

##### 5.1. Manual Workflow

1. **Create a Feature Branch:** Based on `develop`, create a new feature branch for your changes. Use a descriptive
   name (e.g., `feature/add-new-widget`, `bugfix/fix-memory-leak`).
   ```bash
   git checkout -b feature/your-feature-name develop
   ```
2. **Make Your Changes:** Implement your bug fix or feature.

##### 5.2. Gitflow Workflow

1. **Create a Feature Branch:**
   ```bash
   git flow feature start FEATURE_NAME
   ```
   Git flow will create a branch named `feature/FEATURE_NAME` and switch to it.
2. **Make Your Changes:** Implement your bug fix or feature.

**NOTE:** It is recommended to use gitflow extensions for Git to manage your branches and releases more easily. If
you haven't set up gitflow yet, you can do so by following the instructions in
the [gitflow documentation](https://github.com/nvie/gitflow) but if you're not familiar with gitflow, or you don't want
to install it, you can skip
this step.

For more details on the Gitflow Workflow, refer to
the [Gitflow](https://nvie.com/posts/a-successful-git-branching-model/).

#### 6. Build the Project

SHIRO uses CMake for its build system. The primary build instructions are detailed directly within
the [CMakeLists.txt](CMakeLists.txt) file at the root of the project.

In short, a typical build process involves:

```bash
mkdir build
cd build
cmake ..
cmake --build .
```

Refer to the top of `CMakeLists.txt` in each subproject for the most accurate and up-to-date build instructions,
including any
configuration options.

#### 7. Format Your Code (Crucial!)

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

#### 8. Run Static Analysis (Important!)

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

**IMPORTANT:** In step 7 and 8, you should always run the scripts from the root of the subproject you're working on,
(e.g., `SHIRO/kernel/automated/clang-tidy.sh`, `SHIRO/userspace/automated/clang-format-fix.sh`). not the root of the
project because the scripts will run for all subprojects, and it can be slow.

#### 9. Commit Your Changes

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
git commit -m "feat: Add new awesome widget"
```

#### 10. Push Your Feature Branch

Push your feature branch to your forked repository on GitHub:

```bash
git push origin feature/your-feature-name
```

#### 11. Create a Pull Request (PR)

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

#### 12. Code Review

Maintainers will review your pull request. Be prepared to:

* Address any feedback or questions.
* Make further commits to your branch if necessary (these will automatically update the PR).
* Ensure all CI checks (build, format, static analysis, tests, etc.) pass on your PR.

Once your PR is approved and all checks pass, it will be merged into the `develop` branch.

## Need Help?

If you get stuck or have questions about contributing, feel free to:

* Open an [issue](https://github.com/TheMonHub/SHIRO/issues) on GitHub.

-----

Thank you for contributing to SHIRO! We appreciate your efforts in making this project better.
