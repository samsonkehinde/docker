#!/bin/sh

read -p "Enter the IP of your RABBITMQ server: " RABBITMQ
read -p "Enter the IP of your COUCHDB server: " COUCHDB

export RABBITMQ=$RABBITMQ
export COUCHDB=$COUCHDB

../kazoo/run.sh
../freeswitch/run.sh

for CONTAINER in monster-ui rabbitmq kamailio couchdb
do
	if [ "$(docker inspect -f {{.State.Running}} $CONTAINER.kazoo)" = "true" ]
	then
		echo $RABBITMQ $CONTAINER.$NETWORK
	fi
done
exit


