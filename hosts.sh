#!/bin/sh -e

ZONE_IP=${ZONE_IP:-""}
KAZOO_IP=${KAZOO_IP:-""}

if [ -n ZONE_IP ]; then
	for CONTAINER in freeswitch kazoo; do
		if [ "$(docker inspect -f {{.State.Running}} $CONTAINER.kazoo)" = "true" ]; then
			echo "$ZONE_IP $CONTAINER.kazoo"
		fi
	done
	
	for CONTAINER in monster-ui rabbitmq kamailio couchdb; do
		echo "127.0.0.1 $CONTAINER.kazoo"
	done
fi

if [ -n KAZOO_IP ]; then
	for CONTAINER in monster-ui rabbitmq kamailio couchdb; do
		if [ "$(docker inspect -f {{.State.Running}} $CONTAINER.kazoo)" = "true" ]; then
			echo "$KAZOO_IP $CONTAINER.kazoo"
		fi
	done
	
	for CONTAINER in freeswitch kazoo; do
		echo "127.0.0.1 $CONTAINER.kazoo"
	done
fi
