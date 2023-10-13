#!/bin/sh -e

git clone https://github.com/erlang/otp.git
cd otp
export ERL_TOP=`pwd`

git checkout maint-19
./configure
make
make install
export PATH=$ERL_TOP/bin:$PATH  

# curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl
# chmod +x kerl
# mv kerl /usr/bin
# kerl update releases
# kerl build 19.3.6.5 19.3.6.5 # this takes a while
# kerl install 19.3.6.5 erlang
# . erlang/activate
# kerl cleanup all
