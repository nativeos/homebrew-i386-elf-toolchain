class I386ElfBinutils < Formula
  desc "GNU Binutils targetting i386-elf"
  homepage "https://www.gnu.org/software/binutils/"
  url "http://ftpmirror.gnu.org/binutils/binutils-2.29.tar.bz2"
  version "2.29"
  sha256 "29a29549869039aad75fdf507ac30366da5ad0b974fbff4a8e7148dbf4f40ebf"

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
