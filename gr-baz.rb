require 'formula'

class GrBaz < Formula
  homepage 'http://wiki.spench.net/wiki/Gr-baz'
  head 'https://github.com/balint256/gr-baz.git', :revision => '63c68feb'

  depends_on 'pkg-config' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'libusb'
  depends_on 'gnuradio'

  def install
    args = ["--prefix=#{prefix}"]
    system "sh bootstrap"
    system "sh configure", *args
    system "make"
    system "make install"
  end
end
