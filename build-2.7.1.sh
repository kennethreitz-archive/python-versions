#!/usr/bin/env bash
# Usage: $ build.sh <output-dir

SOURCE_TARBALL='http://www.python.org/ftp/python/2.7.1/Python-2.7.1.tar.bz2'
curl $SOURCE_TARBALL | tar jx
mv Python-2.7.1 src
cd src

./configure --prefix=$(pwd)/../python
make
make install

cd ..
tar cjf python-2.7.1.tar.bz2 python/