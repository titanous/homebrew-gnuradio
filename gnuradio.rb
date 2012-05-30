class Gnuradio < Formula
    homepage 'http://gnuradio.org'
    url  'http://gnuradio.org/redmine/attachments/download/326/gnuradio-3.6.0.tar.gz'
    sha1 '7dfb82924cfff2e3af1dc744561d40a8030b05cc'

    depends_on 'pkg-config' => :build
    depends_on 'autoconf' => :build
    depends_on 'automake' => :build
    depends_on 'libtool' => :build
    depends_on 'cmake' => :build
    depends_on 'Cheetah' => :python
    depends_on 'lxml' => :python
    depends_on 'scipy' => :python
    depends_on 'matplotlib' => :python
    depends_on 'numpy' => :python
    depends_on 'boost'
    depends_on 'cppunit'
    depends_on 'guile'
    depends_on 'gsl'
    depends_on 'fftw'
    depends_on 'swig'
    depends_on 'pygtk'
    depends_on 'wxmac'
    depends_on 'sdcc'
    depends_on 'sdl'
    depends_on 'pyqt'
    depends_on 'pyqwt'
    depends_on 'gfortran'
    depends_on 'libusb'

    def install
        # "manual" autoreconf to get '.dylib' extension on shared lib
        system "aclocal --force -I config"
        system "glibtoolize --copy --force"
        system "autoconf --force"
        system "autoheader --force"
        system "automake --add-missing --copy --force-missing"

        args = ["--disable-debug", "--disable-dependency-tracking",
                "--prefix=#{prefix}",
                "--mandir=#{man}"]

        system "./configure", *args
        system "make install"
    end
end
