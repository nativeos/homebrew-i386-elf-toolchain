class I386ElfGdb < Formula
  desc "GNU Project Debugger targetting i386-elf"
  homepage "https://www.gnu.org/software/gdb/"
  url "http://ftpmirror.gnu.org/gnu/gdb/gdb-7.12.tar.gz"
  version "7.12"
  sha256 "149abac4add030a5713f15964bd7465bef7a23712bcc91377ca40949f33e93fb"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--target=i386-elf",
                          "--program-prefix=i386-elf-",
                          "--disable-werror"

    system "make"
    system "make", "install"

    # Conflict with i386-elf-binutils
    FileUtils.rm_rf "#{prefix}/share/info"
    FileUtils.rm_rf "#{prefix}/share/locale"
  end

  test do
    system "false"
  end
end
