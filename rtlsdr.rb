require 'formula'

class Rtlsdr < Formula
  homepage 'sdr.osmocom.org/trac/wiki/rtl-sdr'

  if ARGV.include?('--fm-fork')
    head 'git://github.com/keenerd/rtl-sdr.git'
    depends_on 'sox'
  else
    head 'git://git.osmocom.org/rtl-sdr.git'
  end

  depends_on 'pkg-config' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'cmake' => :build
  depends_on 'libusb'

  def options
    [
      ['--fm-fork', 'Install the fork from keenerd with rtl_fm']
    ]
  end

  def install
    args = ["--prefix=#{prefix}"]
    system "autoreconf -i"
    system "./configure", *args
    system "make install"
  end
end
