## Note for Maintainers

---

1. Ensure all `.clang-format`, and `.clang-tidy` files are consistent across all subprojects:
    - Kernel
    - Bootloader
    - Userspace
    - The root [`.clang-format`](../../.clang-format) and [`.clang-tidy`](../../.clang-tidy) files are the source of
      truth.
    - The `.clang-tidy` in subprojects **can have different checks** from the root `.clang-tidy`.
2. Ensure that automated scripts and Markdown function correctly:
    - Scripts and Markdown are directory-sensitive.
    - They may break if the project structure changes.
3. Ensure that there are automated scripts for clang tidy and clang format and their fix variants inside each
   subproject.
    - If not, add them. 