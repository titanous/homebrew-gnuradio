class Gnuradio < Formula
    homepage 'http://gnuradio.org'
    url 'http://gnuradio.org/redmine/attachments/download/320/gnuradio-3.5.3.tar.gz'
    sha1 '661b9ac54cefa6d1b3de3dbd4f3bf466ac846ee4'

    depends_on 'pkg-config' => :build
    depends_on 'boost'
    depends_on 'cppunit'
    depends_on 'guile'
    depends_on 'gsl'
    depends_on 'swig'
    depends_on 'pygtk'
    depends_on 'wxmac'

    def install
        args = ["--disable-gr-fcd", "--prefix=#{prefix}"]
        system './configure', *args
        system 'make install'
    end
end
