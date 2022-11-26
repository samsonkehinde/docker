#!/bin/sh -e
apt-get install -y --force-yes procps make python build-essential zip unzip libexpat-dev unixodbc-dev libssh2-1-dev libssl-dev libncurses5-dev autoconf

apt-get -y clean
