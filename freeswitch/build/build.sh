#!/bin/sh -e

#install library libks for mod_verto
git clone https://github.com/signalwire/libks
cd libks
cmake .
make
make install

cd ../freeswitch
make
