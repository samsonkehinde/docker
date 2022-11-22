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

# Setup RabbitMQ
cd ../rabbitmq && ./build.sh

# Setup CouchDB
cd ../couchdb &&./build.sh

# Setup Kamailio
# The configuration file for kazoo works with the below version.
cd ../kamailio && ./build.sh d62fd3e4976633aa6b827d527f4e15de0b08068b

#******************* Freeswitch now to be deployed to a VM or another Docker Container host with host network type.
# 1.6.13
#cd ../freeswitch && ./build.sh e755b430da70bd63eebf1dfddacdce48ce863fce
# 1.8
#cd ../freeswitch && ./build.sh 6047ebddfcb06c131a91f329e86fc8efba3e9e31
# 1.10
#cd ../freeswitch && ./build.sh 883d2cb662bed0316e157bd3beb9853e96c60d02

#cd ../freeswitch2 && ./build.sh
#************************************************************************

# Install Kazoo
#cd ../kazoo && ./build.sh c47805b98551d4394f937af5ad745a54e5b9c808

# Kazoo v4.3.142
cd ../kazoo && ./build.sh 44d74cd7373e7706f6afa9809a1d07294c60258d 

#Install Moster UI v5.1
cd ../monster-ui && ./build.sh c3fda2529e403e3cf952fa034802c045da7d3630
