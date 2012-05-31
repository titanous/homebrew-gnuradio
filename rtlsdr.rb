class Rtlsdr < Formula
  homepage 'sdr.osmocom.org/trac/wiki/rtl-sdr'
  head 'git://git.osmocom.org/rtl-sdr.git'

  depends_on 'pkg-config' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'cmake' => :build
  depends_on 'libusb'

  def install
    args = ["--prefix=#{prefix}"]
    system "autoreconf -i"
    system "./configure", *args
    system "make install"
  end
end
