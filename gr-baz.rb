require 'formula'

class GrBaz < Formula
  homepage 'http://wiki.spench.net/wiki/Gr-baz'
  head 'https://github.com/balint256/gr-baz.git'

  depends_on 'cmake' => :build
  depends_on 'gnuradio'

  def install
    mkdir 'build' do
      system 'cmake', '..', *std_cmake_args
      system 'make'
      system 'make install'
    end
  end
end
