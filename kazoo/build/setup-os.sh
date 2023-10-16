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