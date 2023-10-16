#!/bin/sh -e

if [ -n "$SKIP_BUILD" ]
then
	touch skip_build
	exit 0
fi

COMMIT=$(cat commit)

# Compile OpenSSL
git clone git://git.openssl.org/openssl.git
cd openssl
./Configure
make && make install

cd ..
#!/bin/sh -e
curl -O -k https://raw.githubusercontent.com/kerl/kerl/master/kerl
chmod +x kerl
./kerl update releases
./kerl build 19.3.6.5 19.3.6.5
./kerl install 19.3.6.5 erlang
./kerl cleanup all

# Activate erlang for every user logon
echo ". erlang/activate" >> /etc/profile

# REPO is global and must be defined on build
echo $REPO
git clone $REPO kazoo

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

. ../erlang/activate
make deps

