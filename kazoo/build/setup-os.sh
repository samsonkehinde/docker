#!/bin/sh -e
apt-get update
apt-get upgrade -y

apt-get -y --force-yes install vim curl wget git procps make python python3 build-essential zip unzip libexpat-dev unixodbc-dev libssh2-1-dev libssl-dev libncurses5-dev autoconf

apt-get -y clean

if [ -n "$SKIP_BUILD" ]
then
	touch skip_build
	exit 0
fi

# Compile OpenSSL
curl https://www.openssl.org/source/openssl-1.0.2r.tar.gz | tar xfz - && cd openssl-1.0.2r && ./config --prefix=/usr/local/openssl-1.0.2r -fpic
make && make install

wget https://erlang.org/download/otp_src_19.3.tar.gz
tar -vzxf otp_src_19.3.tar.gz
cd otp_src_19.3
export ERL_TOP=`pwd` 
./configure --with-ssl=/usr/local/openssl-1.0.2r
make
make install
export PATH=$ERL_TOP/bin:$PATH     # Assuming bash/sh
