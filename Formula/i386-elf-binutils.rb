class I386ElfBinutils < Formula
  desc "GNU Binutils targetting i386-elf"
  homepage "https://www.gnu.org/software/binutils/"
  url "https://sourceware.org/pub/binutils/releases/binutils-2.36.1.tar.xz"
  version "2.36.1"
  sha256 "e81d9edf373f193af428a0f256674aea62a9d74dfe93f65192d4eae030b0f3b0"
 

  def install
    mkdir "binutils-build" do
      system "../configure", "--prefix=#{prefix}",
                             "--target=i386-elf",
                             "--disable-multilib",
                             "--disable-nls",
                             "--disable-werror"
      system "make"
      system "make", "install"
    end
  end

  test do
    system "i386-elf-as", "--version"
  end
end
