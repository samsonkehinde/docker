#!/bin/bash
INSTALLED=`docker version --format '{{.Server.Version}}'`
REQUIRED="1.9.0"
if [ "$(printf "$REQUIRED\n$INSTALLED" | sort -V | head -n1)" == "$INSTALLED" ] && [ "$INSTALLED" != "$REQUIRED" ]
then
	echo Docker version $INSTALLED is probably too old, required version is $REQUIRED
	exit
fi
cd base-os && ./build.sh
cd ../kazoo-erlang && ./build.sh
cd ../rabbitmq && ./build.sh
cd ../couchdb &&./build.sh
cd ../kamailio && ./build.sh d62fd3e4976633aa6b827d527f4e15de0b08068b
# 1.6.13
#cd ../freeswitch && ./build.sh e755b430da70bd63eebf1dfddacdce48ce863fce
cd ../freeswitch && ./build.sh 6047ebddfcb06c131a91f329e86fc8efba3e9e31
cd ../kazoo && ./build.sh c47805b98551d4394f937af5ad745a54e5b9c808
cd ../monster-ui && ./build.sh
