#!/bin/sh -e


if [ -n "$SKIP_BUILD" ]
then
	touch skip_build
	exit 0
fi

COMMIT=$(cat commit)

# # Compile OpenSSL
# curl https://www.openssl.org/source/openssl-1.0.2r.tar.gz | tar xfz - && cd openssl-1.0.2r && ./config --prefix=/usr/local/openssl-1.0.2r -fpic
# make && make install

# cd ..
# #!/bin/sh -e
# curl -O -k https://raw.githubusercontent.com/kerl/kerl/master/kerl
# chmod +x kerl
# ./kerl update releases
# ./kerl build 19.3.6.5 19.3.6.5
# ./kerl install 19.3.6.5 erlang
# ./kerl cleanup all

# # Activate erlang for every user logon
# echo ". erlang/activate" >> /etc/profile