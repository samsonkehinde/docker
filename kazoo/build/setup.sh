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

# Install Erlang 19
wget http://www.erlang.org/download/otp_src_19.3.tar.gz
tar -zxf otp_src_19.3.tar.gz
cd otp_src_19.3
export ERL_TOP=`pwd` 
./configure
make
make install
export PATH=$ERL_TOP/bin:$PATH     # Assuming bash/sh

# REPO is global and must be defined on build
echo $REPO
git clone $REPO kazoo

COMMIT=$(cat commit)

cd kazoo

if [ -z $BRANCH ]
then
	git reset --hard $COMMIT
	git clean -d -f
else
	git fetch origin $BRANCH:build_branch
	git checkout build_branch
	git clean -d -f
fi
make deps
