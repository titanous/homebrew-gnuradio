require 'formula'

class GrBaz < Formula
  homepage 'http://wiki.spench.net/wiki/Gr-baz'
  head 'https://github.com/balint256/gr-baz.git', :revision => '63c68feb'

  depends_on 'pkg-config' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'libusb'
  depends_on 'gnuradio'

  def patches
    DATA
  end

  def install
    args = ["--prefix=#{prefix}"]
    system "sh bootstrap"
    system "./configure", *args
    system "make"
    system "make install"
  end
end

__END__
diff --git a/bootstrap b/bootstrap
index 2412a7a..8f5799f 100644
--- a/bootstrap
+++ b/bootstrap
@@ -25,5 +25,5 @@ rm -fr config.cache autom4te*.cache
 aclocal -I config
 autoconf
 autoheader
-libtoolize --automake -c -f
+glibtoolize --automake -c -f
 automake --add-missing -c -f -Wno-portability
diff --git a/config/gr_standalone.m4 b/config/gr_standalone.m4
index 35cb789..0ad91ce 100644
--- a/config/gr_standalone.m4
+++ b/config/gr_standalone.m4
@@ -29,7 +29,7 @@ dnl get called too late to be useful.
 m4_define([GR_STANDALONE],
 [
   AC_CONFIG_SRCDIR([config/gr_standalone.m4])
-  AM_CONFIG_HEADER(config.h)
+  AC_CONFIG_HEADER(config.h)
 
   dnl Remember if the user explicity set CXXFLAGS
   if test -n "${CXXFLAGS}"; then
