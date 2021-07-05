class I386ElfGrub < Formula
  desc "GNU GRUB 2 targetting i386-elf"
  homepage "https://www.gnu.org/software/grub/"
  url "https://ftp.gnu.org/gnu/grub/grub-2.06.tar.xz"
  version "2.06"
  sha256 "b79ea44af91b93d17cd3fe80bdae6ed43770678a9a5ae192ccea803ebb657ee1"

  depends_on "nativeos/i386-elf-toolchain/i386-elf-gcc"

  def install
    mkdir "grub-build" do
      system "../configure",
        "--disable-nls",
        "--disable-werror",
        "--disable-efiemu",
        "--target=i386-elf",
        "--prefix=#{prefix}",
        "TARGET_CC=i386-elf-gcc",
        "TARGET_NM=i386-elf-nm",
        "TARGET_OBJCOPY=i386-elf-objcopy",
        "TARGET_RANLIB=i386-elf-ranlib",
        "TARGET_STRIP=i386-elf-strip"

      system "make", "install"
    end
  end

  test do
    system "grub-shell", "--version"
  end
end
