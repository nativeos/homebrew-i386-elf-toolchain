class I386ElfBinutils < Formula
  desc "GNU Binutils targetting i386-elf"
  homepage "https://www.gnu.org/software/binutils/"
  url "https://sourceware.org/pub/binutils/releases/binutils-2.31.tar.xz"
  version "2.31"
  sha256 "231036df7ef02049cdbff0681f4575e571f26ea8086cf70c2dcd3b6c0f4216bf"
 

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
