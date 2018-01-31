# i386-elf-toolchain tap

This is a tap for Homebrew containing a few tools required for building,
running and testing i386-elf binaries such as 32 bit operating system kernels
based on the ELF format, like NativeOS - although it may suit to build and
test other kernels.

## How to use

Tap the repository and install the packages.

    brew tap nativeos/i386-elf-toolchain
    brew install i386-elf-binutils i386-elf-gcc

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
