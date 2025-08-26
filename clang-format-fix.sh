# Copyright (c) 2025 TheMonHub
# Licensed under zlib License

# shellcheck disable=SC2035
shopt -s globstar
find . -type f \( -name "*.cpp" -o -name "*.h" -o -name "*.cppm" \) -not -path "*/_deps/*" -not -path "*/llvm/*" -not -path "*/CMakeFiles/*" -not -path "*/_CPack_Packages/*" -exec clang-format -i -style=file --verbose {} +