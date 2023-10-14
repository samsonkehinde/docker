#!/bin/sh -e
# apt-get -y install \
# 	make flex bison libmysqlclient-dev \
# 	libssl-dev libcurl4-openssl-dev \
# 	libxml2-dev libpcre3-dev librabbitmq-dev \
# 	libjson-c-dev pkg-config  libevent-dev libev-dev \
# 	uuid-dev libunistring-dev xsltproc \
# 	python libsnmp-dev bison

apt-get install -y make flex libsnmp-dev bison python build-essential zip unzip libexpat-dev librabbitmq-dev libpcre3-dev libxml2-dev\
	unixodbc-dev libssh2-1-dev libssl-dev libncurses5-dev libjson-c-dev pkg-config  libunistring-dev uuid-dev  libevent-dev libev-dev libcurl4-openssl-dev

apt-get -y clean
