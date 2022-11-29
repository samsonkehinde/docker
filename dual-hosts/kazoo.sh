#!/bin/sh

../rabbitmq/run.sh
../couchdb/run.sh
../kamailio/run.sh
../monster-ui/run.sh

for CONTAINER in monster-ui rabbitmq kamailio couchdb
do
	if [ "$(docker inspect -f {{.State.Running}} $CONTAINER.kazoo)" = "true" ]
	then
		echo -n '127.0.0.1\n' $CONTAINER.$NETWORK
	fi
done
exit
