class I386ElfGccAT112 < Formula
  desc "GNU Compiler Collection targetting i386-elf"
  homepage "https://gcc.gnu.org"
  url "https://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz"
  sha256 "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b"
  revision 2

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
      binutils = Formula["i386-elf-binutils"].prefix
      ln_sf "#{binutils}/i386-elf", "#{prefix}/i386-elf"
    end
  end

  test do
    system "#{bin}/i386-elf-gcc", "--version"
  end
end
