class I386ElfGdb < Formula
  desc "GNU Project Debugger targetting i386-elf"
  homepage "https://www.gnu.org/software/gdb/"
  url "http://ftpmirror.gnu.org/gnu/gdb/gdb-8.0.tar.xz"
  version "8.0"
  sha256 "f6a24ffe4917e67014ef9273eb8b547cb96a13e5ca74895b06d683b391f3f4ee"

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
    system "i386-elf-gdb", "--version"
  end
end
