#!/bin/sh -e

if [[ -n "$KAZOO_IP" ]]; then
	for CONTAINER in freeswitch kazoo; do
		if [ "$(docker inspect -f {{.State.Running}} $CONTAINER.kazoo)" = "true" ]; then
			echo 127.0.0.1 $CONTAINER.kazoo
		fi
	done
	
	for CONTAINER in monster-ui rabbitmq kamailio couchdb; do
		echo $KAZOO_IP $CONTAINER.kazoo
	done
fi

if [[ -n "$ZONE_IP" ]]; then
	for CONTAINER in monster-ui rabbitmq kamailio couchdb; do
		if [ "$(docker inspect -f {{.State.Running}} $CONTAINER.kazoo)" = "true" ]; then
			echo 127.0.0.1 $CONTAINER.kazoo
		fi
	done
	
	for CONTAINER in freeswitch kazoo; do
		echo $ZONE_IP $CONTAINER.kazoo
	done
fi
