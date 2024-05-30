class I386ElfGcc < Formula
  desc "GNU Compiler Collection targetting i386-elf"
  homepage "https://gcc.gnu.org"
  url "https://ftp.gnu.org/gnu/gcc/gcc-14.1.0/gcc-14.1.0.tar.xz"
  sha256 "e283c654987afe3de9d8080bc0bd79534b5ca0d681a73a11ff2b5d3767426840"
  revision 1

  depends_on "gmp" => :build
  depends_on "mpfr" => :build
  depends_on "libmpc"
  depends_on "nativeos/i386-elf-toolchain/i386-elf-binutils"

  def install
    mkdir "gcc-build" do
      system "../configure", "--prefix=#{prefix}",
                             "--target=i386-elf",
                             "--disable-multilib",
                             "--disable-nls",
                             "--disable-werror",
                             "--without-headers",
                             "--without-isl",
                             "--enable-languages=c,c++"

      system "make", "all-gcc"
      system "make", "install-gcc"
      system "make", "all-target-libgcc"
      system "make", "install-target-libgcc"

      # GCC needs this folder in #{prefix} in order to see the binutils.
      # It doesn't look for i386-elf-as on $PREFIX/bin. Rather, it looks
      # for as on $PREFIX/$TARGET/bin/ ($PREFIX/i386-elf/bin/as).
      binutils = Formula["nativeos/i386-elf-toolchain/i386-elf-binutils"].prefix
      ln_sf "#{binutils}/i386-elf", "#{prefix}/i386-elf"
    end
  end

  test do
    # should try to compile something?
    system "#{bin}/i386-elf-gcc", "--version"
  end
end
