set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -subsystem:efi_application -entry:_start")
set(CMAKE_EXECUTABLE_SUFFIX ".efi")