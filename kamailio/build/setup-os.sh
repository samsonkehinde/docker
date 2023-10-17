#!/bin/sh -e

apt-get install -y make flex libsnmp-dev bison python build-essential zip unzip libexpat-dev librabbitmq-dev libpcre3-dev libxml2-dev\
	unixodbc-dev libssh2-1-dev libssl-dev libncurses5-dev libjson-c-dev pkg-config  libunistring-dev uuid-dev  libevent-dev libev-dev libcurl4-openssl-dev

apt-get -y clean
