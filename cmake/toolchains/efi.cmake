set(CMAKE_ASM_NASM_COMPILE_OBJECT
        "<CMAKE_ASM_NASM_COMPILER> <FLAGS> -f win64 <INCLUDES> -o <OBJECT> <SOURCE>"
)
set(CMAKE_C_COMPILE_OBJECT
        "<CMAKE_C_COMPILER> <FLAGS> -target x86_64-pc-windows-gnu  <INCLUDES> -c -o <OBJECT> <SOURCE>"
)
set(CMAKE_CXX_COMPILE_OBJECT
        "<CMAKE_CXX_COMPILER> <FLAGS> -target x86_64-pc-windows-gnu <INCLUDES> -c -o <OBJECT> <SOURCE>"
)

set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> -flavor link <LINK_FLAGS> -subsystem:efi_application -entry:_start -nodefaultlib ${SHIRO_CXX_PREOBJECTS_COFF} <OBJECTS> <LINK_LIBRARIES> ${SHIRO_CXX_POSTOBJECTS_COFF} /out:<TARGET>")
set(CMAKE_CXX_LINK_EXECUTABLE "<CMAKE_LINKER> -flavor link <LINK_FLAGS> -subsystem:efi_application -entry:_start -nodefaultlib ${SHIRO_CXX_PREOBJECTS_COFF} <OBJECTS> <LINK_LIBRARIES> ${SHIRO_CXX_POSTOBJECTS_COFF} /out:<TARGET>")
set(CMAKE_ASM_NASM_LINK_EXECUTABLE "<CMAKE_LINKER> -flavor link <LINK_FLAGS> -subsystem:efi_application -entry:_start -nodefaultlib ${SHIRO_CXX_PREOBJECTS_COFF} <OBJECTS> <LINK_LIBRARIES> ${SHIRO_CXX_POSTOBJECTS_COFF} /out:<TARGET>")

set(CMAKE_EXECUTABLE_SUFFIX ".EFI")

set_output_run(${CMAKE_BINARY_DIR}/boot/EFI)

set(TARGET_OBJECT "COFF" CACHE INTERNAL "Target object format" FORCE)

