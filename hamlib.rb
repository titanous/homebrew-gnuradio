class Hamlib < Formula
    homepage 'http://sourceforge.net/apps/mediawiki/hamlib/'
    url 'https://downloads.sourceforge.net/project/hamlib/hamlib/1.2.15/hamlib-1.2.15.tar.gz'
    head 'git://hamlib.git.sourceforge.net/gitroot/hamlib/hamlib'
    sha1 '8133ade08d9ec1874bbca9e552197f48588fd3a8'

    depends_on 'pkg-config' => :build
    depends_on 'swig' => :build

    if ARGV.build_head? and MacOS.xcode_version >= "4.3"
        depends_on 'automake' => :build
        depends_on 'libtool' => :build
    end

    def patches
        if not ARGV.build_head?
            DATA
        end
    end

    def install
        if ARGV.build_head?
            system "glibtoolize"
            system "autoreconf", "-f", "-i"
        end
        args = ["--prefix=#{prefix}"]
        system './configure', *args
        system 'make install'
    end
end

__END__

The libusb library is exported as libusb-1.0 in Homebrew, fix the configure
scripts accordingly.

diff -ur hamlib-1.2.15.org/configure hamlib-1.2.15/configure
--- hamlib-1.2.15.org/configure	2012-02-03 03:47:07.000000000 +0100
+++ hamlib-1.2.15/configure	2012-04-16 17:05:11.000000000 +0200
@@ -19863,12 +19863,12 @@
     pkg_cv_LIBUSB_CFLAGS="$LIBUSB_CFLAGS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libusb >= 0.1\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libusb >= 0.1") 2>&5
+    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libusb-1.0 >= 0.1\""; } >&5
+  ($PKG_CONFIG --exists --print-errors "libusb-1.0 >= 0.1") 2>&5
   ac_status=$?
   $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
-  pkg_cv_LIBUSB_CFLAGS=`$PKG_CONFIG --cflags "libusb >= 0.1" 2>/dev/null`
+  pkg_cv_LIBUSB_CFLAGS=`$PKG_CONFIG --cflags "libusb-1.0 >= 0.1" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
 else
   pkg_failed=yes
@@ -19880,12 +19880,12 @@
     pkg_cv_LIBUSB_LIBS="$LIBUSB_LIBS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" && \
-    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libusb >= 0.1\""; } >&5
-  ($PKG_CONFIG --exists --print-errors "libusb >= 0.1") 2>&5
+    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"libusb-1.0 >= 0.1\""; } >&5
+  ($PKG_CONFIG --exists --print-errors "libusb-1.0 >= 0.1") 2>&5
   ac_status=$?
   $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
   test $ac_status = 0; }; then
-  pkg_cv_LIBUSB_LIBS=`$PKG_CONFIG --libs "libusb >= 0.1" 2>/dev/null`
+  pkg_cv_LIBUSB_LIBS=`$PKG_CONFIG --libs "libusb-1.0 >= 0.1" 2>/dev/null`
 		      test "x$?" != "x0" && pkg_failed=yes
 else
   pkg_failed=yes
@@ -19906,20 +19906,20 @@
         _pkg_short_errors_supported=no
 fi
         if test $_pkg_short_errors_supported = yes; then
-	        LIBUSB_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "libusb >= 0.1" 2>&1`
+	        LIBUSB_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "libusb-1.0 >= 0.1" 2>&1`
         else
-	        LIBUSB_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "libusb >= 0.1" 2>&1`
+	        LIBUSB_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "libusb-1.0 >= 0.1" 2>&1`
         fi
 	# Put the nasty error message in config.log where it belongs
 	echo "$LIBUSB_PKG_ERRORS" >&5
 
-	{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: libusb pkg-config not found, USB backends will be disabled" >&5
-$as_echo "$as_me: WARNING: libusb pkg-config not found, USB backends will be disabled" >&2;}
+	{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: libusb-1.0 pkg-config not found, USB backends will be disabled" >&5
+$as_echo "$as_me: WARNING: libusb-1.0 pkg-config not found, USB backends will be disabled" >&2;}
 elif test $pkg_failed = untried; then
      	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
 $as_echo "no" >&6; }
-	{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: libusb pkg-config not found, USB backends will be disabled" >&5
-$as_echo "$as_me: WARNING: libusb pkg-config not found, USB backends will be disabled" >&2;}
+	{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: libusb-1.0 pkg-config not found, USB backends will be disabled" >&5
+$as_echo "$as_me: WARNING: libusb-1.0 pkg-config not found, USB backends will be disabled" >&2;}
 else
 	LIBUSB_CFLAGS=$pkg_cv_LIBUSB_CFLAGS
 	LIBUSB_LIBS=$pkg_cv_LIBUSB_LIBS
