class I386ElfGdb < Formula
  desc "GNU Project Debugger targetting i386-elf"
  homepage "https://www.gnu.org/software/gdb/"
  url "https://ftp.gnu.org/gnu/gdb/gdb-10.2.tar.xz"
  sha256 "aaa1223d534c9b700a8bec952d9748ee1977513f178727e1bee520ee000b4f29"
  revision 2

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--target=i386-elf",
                          "--program-prefix=i386-elf-",
                          "--disable-werror"

    system "make"
    system "make", "install"

    # Conflict with i386-elf-binutils
    rm_rf info
    rm_rf "#{share}/locale"
  end

  test do
    system "#{bin}/i386-elf-gdb", "--version"
  end
end
