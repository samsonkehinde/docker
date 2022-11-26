#!/bin/sh -e
wget --no-check-certificate http://www.erlang.org/download/otp_src_19.2.tar.gz
tar -zxf otp_src_19.2.tar.gz

cd otp_src_19.2
export ERL_TOP=`pwd` 

./configure # Prepare to install Erlang/OTP release to /usr/local/{bin,lib/erlang}
make
make install


