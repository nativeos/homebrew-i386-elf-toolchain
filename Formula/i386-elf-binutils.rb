class I386ElfBinutils < Formula
  desc "GNU Binutils targetting i386-elf"
  homepage "https://www.gnu.org/software/binutils/"
  url "https://sourceware.org/pub/binutils/releases/binutils-2.42.tar.xz"
  sha256 "f6e4d41fd5fc778b06b7891457b3620da5ecea1006c6a4a41ae998109f85a800"
  revision 1

  depends_on "texinfo" => :build

  def install
    mkdir "binutils-build" do
      system "../configure", "--prefix=#{prefix}",
                             "--target=i386-elf",
                             "--disable-multilib",
                             "--disable-nls",
                             "--disable-werror",
                             "--enable-interwork"
      system "make"
      system "make", "install"
    end
  end

  test do
    (testpath/"program.S").write <<~DATA
    .text
    example:
        movl 0x80, %eax
        movl 0x40, %ebx     
    DATA
    system "#{bin}/i386-elf-as", "program.S"
    assert_match "file format elf32-i386", shell_output("#{bin}/i386-elf-objdump -D a.out")
  end
end
