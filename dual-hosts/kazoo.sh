#!/bin/sh

../rabbitmq/run.sh
../couchdb/run.sh
../kamailio/run.sh
../monster-ui/run.sh

for CONTAINER in freeswitch kazoo
do
	if [ "$(docker inspect -f {{.State.Running}} $CONTAINER.kazoo)" = "true" ]
	then
		echo -n '$KAZOOIP' $CONTAINER.$NETWORK
	fi
done

../hosts.sh >> /etc/hosts

exit
