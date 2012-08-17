require 'formula'

class Gnuradio < Formula
  homepage 'http://gnuradio.org'
  url  'http://gnuradio.org/releases/gnuradio/gnuradio-3.6.1.tar.gz'
  sha1 'ee4c40b366d94887511eefa6ce52df4bdbc9d105'
  head 'git://gnuradio.org/gnuradio.git'

  depends_on 'cmake' => :build
  depends_on 'Cheetah' => :python
  depends_on 'lxml' => :python
  depends_on 'numpy' => :python
  depends_on 'scipy' => :python
  depends_on 'matplotlib' => :python
  depends_on 'python'
  depends_on 'boost'
  depends_on 'cppunit'
  depends_on 'gsl'
  depends_on 'fftw'
  depends_on 'swig'
  depends_on 'pygtk'
  depends_on 'sdl'
  depends_on 'libusb'
  depends_on 'orc'
  depends_on 'pyqt' if ARGV.include?('--with-qt')
  depends_on 'pyqwt' if ARGV.include?('--with-qt')
  depends_on 'doxygen' if ARGV.include?('--with-docs')

  fails_with :clang do
    build 421
    cause "Fails to compile .S files."
  end

  def options
    [
      ['--with-qt', 'Build gr-qtgui.'],
      ['--with-docs', 'Build docs.']
    ]
  end

  def patches
    DATA
  end

  def install
    mkdir 'build' do
      args = ["-DCMAKE_PREFIX_PATH=#{prefix}", "-DQWT_INCLUDE_DIRS=#{HOMEBREW_PREFIX}/lib/qwt.framework/Headers"] + std_cmake_args
      args << '-DENABLE_GR_QTGUI=OFF' unless ARGV.include?('--with-qt')
      args << '-DENABLE_DOXYGEN=OFF' unless ARGV.include?('--with-docs')
      args << "-DPYTHON_LIBRARY=#{python_path}/Frameworks/Python.framework/"
      system 'cmake', '..', *args
      system 'make'
      system 'make install'
    end
  end

  def python_path
    python = Formula.factory('python')
    kegs = python.rack.children.reject { |p| p.basename.to_s == '.DS_Store' }
    kegs.find { |p| Keg.new(p).linked? } || kegs.last
  end

  def caveats
    <<-EOS.undent
    If you want to use custom blocks, create this file:

    ~/.gnuradio/config.conf
      [grc]
      local_blocks_path=/usr/local/share/gnuradio/grc/blocks
    EOS
  end
end

__END__
diff --git a/grc/CMakeLists.txt b/grc/CMakeLists.txt
index f54aa4f..db0ce3c 100644
--- a/grc/CMakeLists.txt
+++ b/grc/CMakeLists.txt
@@ -25,7 +25,7 @@ include(GrPython)
 GR_PYTHON_CHECK_MODULE("python >= 2.5"     sys          "sys.version.split()[0] >= '2.5'"           PYTHON_MIN_VER_FOUND)
 GR_PYTHON_CHECK_MODULE("Cheetah >= 2.0.0"  Cheetah      "Cheetah.Version >= '2.0.0'"                CHEETAH_FOUND)
 GR_PYTHON_CHECK_MODULE("lxml >= 1.3.6"     lxml.etree   "lxml.etree.LXML_VERSION >= (1, 3, 6, 0)"   LXML_FOUND)
-GR_PYTHON_CHECK_MODULE("pygtk >= 2.10.0"   gtk          "gtk.pygtk_version >= (2, 10, 0)"           PYGTK_FOUND)
+GR_PYTHON_CHECK_MODULE("pygtk >= 2.10.0"   pygtk        True                                        PYGTK_FOUND)
 GR_PYTHON_CHECK_MODULE("numpy"             numpy        True                                        NUMPY_FOUND)
 
 ########################################################################
diff --git a/gr-qtgui/lib/spectrumdisplayform.ui b/gr-qtgui/lib/spectrumdisplayform.ui
index 049d4ff..a40502b 100644
--- a/gr-qtgui/lib/spectrumdisplayform.ui
+++ b/gr-qtgui/lib/spectrumdisplayform.ui
@@ -518,7 +518,6 @@
   </layout>
  </widget>
  <layoutdefault spacing="6" margin="11"/>
- <pixmapfunction>qPixmapFromMimeSource</pixmapfunction>
  <customwidgets>
   <customwidget>
    <class>QwtWheel</class>
