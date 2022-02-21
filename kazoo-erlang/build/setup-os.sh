#!/bin/sh -e
apt-get install -y make python build-essential zip unzip libexpat-dev \
	unixodbc-dev libssh2-1-dev libssl-dev libncurses5-dev python automake autoconf
apt-get -y clean
