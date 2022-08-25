#!/bin/sh -e
curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl
chmod +x kerl
mv kerl /usr/bin
kerl update releases
kerl build 19.3.6.5 19.3.6.5 # this takes a while
kerl install 19.3.6.5 erlang
. erlang/activate
kerl cleanup all
