## Note for Maintainers

---

1. Ensure all `.clang-format` and `.clang-tidy` files are consistent across all subprojects:
    - Kernel
    - Bootloader
    - Userspace
    - Automated scripts (see [automated](../../automated))
    - The root [`.clang-format`](../../.clang-format) and [`.clang-tidy`](../../.clang-tidy) files are the source of
      truth.
    - The `.clang-tidy` in subprojects can have different checks from the root `.clang-tidy`.
2. Verify that automated scripts and Markdown function correctly:
    - Scripts and Markdown are directory-sensitive.
    - They may break if the project structure changes.