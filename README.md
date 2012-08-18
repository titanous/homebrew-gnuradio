# homebrew-gnuradio

This is a collection of [Homebrew](https://github.com/mxcl/homebrew) recipes
that makes it easier get GNU Radio and friends running on OS X.

## Installation

These steps have been tested on Lion 10.7.4 with Xcode 4.3.2 and Mountain Lion
10.8 with Xcode 4.4.1.

- Add this line to your profile (ie `~/.bash_profile` or `~/.zshenv`) and reload
  your shell (`exec $SHELL`)

  ```sh
  export PATH=/usr/local/bin:/usr/local/share/python:$PATH
  ```

- Install the python package prerequisites

  ```sh
  brew install python gfortran umfpack swig
  ```

- Install the prerequisite python packages

  ```sh
  pip install numpy Cheetah lxml
  pip install https://github.com/scipy/scipy/tarball/v0.11.0rc2
  LDFLAGS="-L/usr/X11/lib" CFLAGS="-I/usr/X11/include -I/usr/X11/include/freetype2 -I/usr/X11/include/libpng12" pip install http://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-1.1.1/matplotlib-1.1.1.tar.gz
  ```

- Install gnuradio (add `--with-qt` for `gr-qtgui`)

  ```sh
  brew tap titanous/homebrew-gnuradio
  brew install gnuradio
  ```
- Create the `~/.gnuradio/config.conf` config file for custom block support

  ```ini
  [grc]
  local_blocks_path=/usr/local/share/gnuradio/grc/blocks
  ```

### Optional (for `gr-wxgui`)

- Before installing `gnuradio`, install `wxmac` 2.9 with python bindings

  ```sh
  brew install wxmac --python
  ```

### Optional (for rtl-sdr devices)

- Install `rtlsdr` and related blocks

  ```sh
  brew install rtlsdr gr-osmosdr gr-baz --HEAD
  ```
