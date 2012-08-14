# homebrew-gnuradio

This is a collection of [Homebrew](https://github.com/mxcl/homebrew) recipes
that makes it easier get GNU Radio and friends running on OS X.

## Installation

These steps have been tested on OS X Lion 10.7.4 with Xcode 4.3.2.

- Add this repository as a brew tap

  ```sh
  brew tap titanous/homebrew-gnuradio
  ```

- Add these lines to your profile (ie `~/.bash_profile` or `~/.zshenv`) and reload
  your shell (`exec $SHELL`)

  ```sh
  export DYLD_FRAMEWORK_PATH=/usr/local/lib:$DYLD_FRAMEWORK_PATH
  export PATH=/usr/local/bin:/usr/local/share/python:$PATH
  ```

- Install the python package prerequisites

  ```sh
  brew install python --framework
  brew install gfortran umfpack swig
  ```

- Install the prerequisite python packages

  ```sh
  pip install numpy
  pip install Cheetah lxml scipy
  export LDFLAGS="-L/usr/X11/lib"
  export CFLAGS="-I/usr/X11/include -I/usr/X11/include/freetype2 -I/usr/X11/include/libpng12"
  pip install http://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-1.1.1/matplotlib-1.1.1.tar.gz
  ```

- Install gnuradio (add `--with-qt` for `gr-qtgui`)

  ```sh
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
