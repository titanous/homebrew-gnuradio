require 'formula'

class GrBaz < Formula
  homepage 'http://wiki.spench.net/wiki/Gr-baz'
  head 'git://github.com/balint256/gr-baz.git'

  depends_on 'pkg-config' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'libusb'

  def install
    args = ["--prefix=#{prefix}"]
    system "autoreconf -i"
    system "./configure", *args
    system "make install"
  end
end
