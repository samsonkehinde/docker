#!/bin/sh -e
apt-get update
apt-get upgrade -y

apt-get -y --force-yes install erlang-dev vim curl wget git procps make python python3 build-essential zip unzip libexpat-dev unixodbc-dev libssh2-1-dev libssl-dev libncurses5-dev autoconf

apt-get -y clean

if [ -n "$SKIP_BUILD" ]
then
	touch skip_build
	exit 0
fi

#!/bin/sh -e
curl -O -k https://raw.githubusercontent.com/kerl/kerl/master/kerl
chmod +x kerl
./kerl update releases
./kerl build 19.3.6.5 19.3.6.5
./kerl install 19.3.6.5 erlang
. erlang/activate
./kerl cleanup all

# Activate erlang for every user logon
echo ". erlang/activate" >> /etc/profile

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

cd deps && make distclean

