#!/bin/sh -x

curl -sO https://www.python.org/ftp/python/2.6.6/Python-2.6.6.tgz
tar xvf Python-2.6.6.tgz
pushd Python-2.6.6
./configure --prefix "$(pwd)/dest"
make -j 4
make install
dest/bin/python --version
popd
