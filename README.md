# clang-windows-cmake
CMake toolchain for cross compiling Windows binaries on Linux using Clang.

### Isn't that what mingw does already?
Yes, but mingw has some disadvantages. One of which is that it uses its own standard library, which must be statically linked or usually packaged as dlls along with the actual product. This significantly increases the size of the package, especially for smaller programs/libraries.

Clang on the other hand, can use the official SDK provided by Microsoft, which means that it uses the same runtime libraries as MSVC which are preinstalled on most modern Windows versions (if not, it can easily be installed manually).

TL;DR:

- Pros:
    - Can use the same standard library as MSVC.
    - Uses the same compiler that you could use to compile native binaries on your system.
    - Somewhat officially supported by Microsoft[(?)](https://learn.microsoft.com/en-us/cpp/build/clang-support-msbuild)

- Cons:
    - MUST use the Windows SDK provided by Microsoft.
    - Some compatibility issues with older versions of Clang.

- So why not just use MSVC directly?
    - You'll need to use Wine, which adds overhead on top of it.

# Requirements
- CMake 3.7 or later.
- clang/llvm 8.0.0 or later (latest version is recommended)
- A copy of MSVC and the Windows SDK.
    - You'll need a Windows machine to download them, or you can use the [vsdownload script](https://github.com/mstorsjo/msvc-wine/blob/master/vsdownload.py) from the msvc-wine project.
    - You'll also need to rename all of the .lib files to be lowercased.

# Installation
Clone/download this repo, then edit the config.cmake file to set the path and version of MSVC and the Windows SDK. Note that the path should be absolute.

# Usage
`i686-clang-windows-cmake` and `x86_64-clang-windows-cmake` are wrappers around CMake which sets the toolchain automatically for you. Simply replace `cmake` in your command invocation with one of them to use it, depending on the architecture you want to compile for (i686 for 32-bit, x86_64 for 64-bit). Alternatively, you can set the toolchain file manually.

You can use the run.sh script provided in the `test` folder to compile a test project and see if the compiler works.

Note that Windows system libraries (user32, ole32, etc.) must be linked explicitly if you want to use them.

# License
This project is in the public domain.
