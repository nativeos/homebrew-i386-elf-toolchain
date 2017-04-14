# i386-elf-toolchain tap

This is a tap for Homebrew containing a few tools required for building,
running and testing i386-elf binaries such as 32 bit operating system kernels
based on the ELF format, like NativeOS - although it may suit to build and
test other kernels.

Please, note that at the moment this tap has only been tested on Homebrew for
MacOS X. I don't know whether this will work with Linuxbrew.

## How to use

Tap the repository and install the packages.

    brew tap nativeos/i386-elf-toolchain
    brew install i386-elf-binutils i386-elf-gcc
