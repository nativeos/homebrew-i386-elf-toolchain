# i386-elf-toolchain tap

This tap provides Homebrew formulas to build a suitable compiler for the
i386-elf toolchain, which is useful to build 32 bit freestanding
applications such as kernels using the GNU toolchain.

The formulas in this repo are based in the instructions that at some
point were provided by the [OSDev wiki]. The page has changed in these
years, but as long as the instructions continue working, I will not
probably update the compile flags unless there is some benefit.

I test this tap in macOS and Linux.

  [OSDev wiki]: https://wiki.osdev.org/GCC_Cross-Compiler

## Currently packaged versions

  -------------------------------------------------------------------------------------------
  package                           version   notes
  --------------------------------- --------- -----------------------------------------------
  i386-elf-binutils                 2.37

  i386-elf-gcc                      11.1.0    Not to be confused with the i386-elf-gcc in
                                              homebrew/core. Depends on
                                              nativeos/i386-elf-toolchain/i386-elf-binutils

  i386-elf-gdb                      10.2.0    Not to be confused with the i386-elf-gdb in
                                              homebrew/core

  i386-elf-grub                     2.0.6     Depends on
                                              nativeos/i386-elf-toolchain/i386-elf-gcc
  -------------------------------------------------------------------------------------------

Old versions ported:

-   For binutils: 2.36.1
    (`nativeos/i386-elf-toolchain/i386-elf-binutils@2.36.1`).

## How to use

Tap the repository and install the packages.

    brew tap nativeos/i386-elf-toolchain
    brew install nativeos/i386-elf-toolchain/i386-elf-binutils
    brew install nativeos/i386-elf-toolchain/i386-elf-gcc
    brew install nativeos/i386-elf-toolchain/i386-elf-grub
    brew install nativeos/i386-elf-toolchain/i386-elf-gdb

## Disclaimer

There is a real formula for GNU GRUB in this repo. The purpose of this
formula is to make easier to install GRUB on a Mac in order to author
ISO files containing kernel images and bootloaders, or virtual hard
drives or IMG files. **BE CAREFUL WITH THIS**, you don't want to
accidentaly wipe your host bootloader with this.

These formulaes are provided here for utility reasons in the hope that
they are useful to people playing with operating systems and kernel
development, but they come with no warranties. I'm not responsible on
whatever you do with these formulaes. Always check the contents of a
formula before installing it.
