class Gnuradio < Formula
  homepage 'http://gnuradio.org'
  url  'http://gnuradio.org/redmine/attachments/download/326/gnuradio-3.6.0.tar.gz'
  sha1 '7dfb82924cfff2e3af1dc744561d40a8030b05cc'

  depends_on 'cmake' => :build
  depends_on 'Cheetah' => :python
  depends_on 'lxml' => :python
  depends_on 'numpy' => :python
  depends_on 'scipy' => :python
  depends_on 'matplotlib' => :python
  depends_on 'boost'
  depends_on 'cppunit'
  depends_on 'gsl'
  depends_on 'fftw'
  depends_on 'swig'
  depends_on 'pygtk'
  depends_on 'sdl'
  depends_on 'pyqt' if ARGV.include?('--with-qt')
  depends_on 'pyqwt' if ARGV.include?('--with-qt')

  def options
    [
      ['--with-qt', 'Build gr-qtgui.']
    ]
  end

  def patches
    DATA
  end

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

__END__
diff --git a/cmake/Modules/FindQwt.cmake b/cmake/Modules/FindQwt.cmake
index f2cf344..0d3f45c 100644
--- a/cmake/Modules/FindQwt.cmake
+++ b/cmake/Modules/FindQwt.cmake
@@ -12,6 +12,7 @@ find_path (QWT_INCLUDE_DIRS
 	/usr/include/qwt
 	/opt/local/include/qwt
 	/sw/include/qwt
+	/usr/local/lib/qwt.framework/Headers
 )
 
 find_library (QWT_LIBRARIES
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
