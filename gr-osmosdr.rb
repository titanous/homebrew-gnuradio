class GrOsmosdr < Formula
  homepage 'http://sdr.osmocom.org/trac/wiki/GrOsmoSDR'
  head 'git://git.osmocom.org/gr-osmosdr'

  depends_on 'cmake' => :build
  depends_on 'gnuradio'
  depends_on 'rtlsdr'

  def install
    mkdir 'build' do
      system 'cmake', '..',
                      "-DCMAKE_PREFIX_PATH=#{prefix}",
                      *std_cmake_args
      system 'make'
      system 'make install'
    end
  end
end
