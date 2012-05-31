# homebrew-gnuradio

This is a collection of [Homebrew](https://github.com/mxcl/homebrew) recipes
that makes it easier get GNU Radio and friends running on OS X.

## Installation

These steps have been tested on OS X Lion 10.7.4 with Xcode 4.3.2.

- Add this repository as a brew tap.
  ```sh
  brew tap titanous/homebrew-gnuradio
  ```

- Add this line to your profile (ie `~/.bash_profile` or `~/.zshenv`) and reload
  your shell (`exec $SHELL`):
  ```sh
  export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
  ```

- Install the python package prerequisites:
  ```sh
  brew install gfortran umfpack
  ```

- Install the prerequisite python packages:
  ```sh
  sudo easy_install pip
  sudo pip install Cheetah lxml numpy scipy matplotlib
  ```

- Install gnuradio (add `--with-qt` for `gr-qtgui`):
  ```sh
  brew install gnuradio
  ```

### Optional (for `gr-wxgui`)

- Install `wxmac` 2.9 using llvm (the stable version is broken on Lion) with python bindings:
  ```sh
  brew install wxmac --devel --use-llvm --python
  ```
