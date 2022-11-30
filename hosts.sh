#!/bin/sh -e

if [[ -n "$KAZOO_IP" ]]; then
	for CONTAINER in freeswitch kazoo; do
		if [ "$(docker inspect -f {{.State.Running}} $CONTAINER.kazoo)" = "true" ]; then
			echo -n " --add-host=$CONTAINER.kazoo:`ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1`"
		fi
	done
	
	for CONTAINER in monster-ui rabbitmq kamailio couchdb; do
		echo -n " --add-host=$CONTAINER.kazoo:$KAZOO_IP"
	done
fi

if [[ -n "$ZONE_IP" ]]; then
	for CONTAINER in monster-ui rabbitmq kamailio couchdb; do
		if [ "$(docker inspect -f {{.State.Running}} $CONTAINER.kazoo)" = "true" ]; then
			echo -n " --add-host=$CONTAINER.kazoo:`ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1`"
		fi
	done
	
	for CONTAINER in freeswitch kazoo; do
		echo -n " --add-host=$CONTAINER.kazoo:$ZONE_IP"
	done
fi
