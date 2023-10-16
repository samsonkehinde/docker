#!/bin/sh -e
apt-get update
apt-get upgrade -y

apt-get -y --force-yes install vim curl wget git procps make python python3 build-essential zip unzip libexpat-dev unixodbc-dev libssh2-1-dev libssl-dev libncurses5-dev autoconf

apt-get -y clean
