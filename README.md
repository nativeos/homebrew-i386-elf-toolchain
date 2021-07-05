# i386-elf-toolchain tap

This is a tap for Homebrew containing a few tools required for building,
running and testing i386-elf binaries such as 32 bit operating system kernels
based on the ELF format, like NativeOS - although it may suit to build and
test other kernels.

## Currently packaged versions

| package | version | notes |
| ----------------- | --- | --- |
| i386-elf-binutils | 2.36.1 | |
| i386-elf-gcc | 11.1.0 | Not to be confused with the i386-elf-gcc in homebrew/core. Depends on nativeos/i386-elf-toolchain/i386-elf-binutils |
| i386-elf-gdb | 10.2.0 | Not to be confused with the i386-elf-gdb in homebrew/core |
| i386-elf-grub | 2.0.6 | Depends on nativeos/i386-elf-toolchain/i386-elf-gcc |
| --- | --- | --- |

## How to use

Tap the repository and install the packages.

    brew tap nativeos/i386-elf-toolchain
    brew install nativeos/i386-elf-toolchain/i386-elf-binutils
    brew install nativeos/i386-elf-toolchain/i386-elf-gcc
    brew install nativeos/i386-elf-toolchain/i386-elf-grub
    brew install nativeos/i386-elf-toolchain/i386-elf-gdb

## Disclaimer

There is a real formula for GNU GRUB in this repo. The purpose of this formula
is to make easier to install GRUB on a Mac in order to author ISO files
containing kernel images and bootloaders, or virtual hard drives or IMG files.
**BE CAREFUL WITH THIS**, you don't want to accidentaly wipe your host
bootloader with this.

These formulaes are provided here for utility reasons in the hope that they
are useful to people playing with operating systems and kernel development,
but they come with no warranties. I'm not responsible on whatever you do with
these formulaes. Always check the contents of a formula before installing it.
