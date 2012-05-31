# homebrew-gnuradio

This is a collection of [Homebrew](https://github.com/mxcl/homebrew) recipes
that makes it easier get gnuradio and friends running on OS X.

## Installation

These steps have been tested on Lion with Xcode 4.3.2.

- Add this repository as a brew tap.
  ```sh
  brew tap titanous/homebrew-ham
  ```

- Add this line to your `.bash_profile` or `.zshenv`:
  ```sh
  export PYTHON_PATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
  ```

- Install the python package prerequisites:
  ```sh
  brew install gfortran umfpack
  ```

- Install the prequisite python packages:
  ```sh
  sudo easy_install pip
  sudo pip install Cheetah lxml numpy scipy matplotlib
  ```

- Install `wxmac` 2.9 using llvm (the stable version is broken on Lion) with python bindings.
  ```sh
  brew install wxmac --devel --use-llvm --python
  ```
