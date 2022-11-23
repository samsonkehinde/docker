#!/bin/sh -e
FLAGS=${FLAGS:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
NAME=${NAME:-"kazoo.$NETWORK"}
COUCHDB=${COUCHDB:-"couchdb.$NETWORK"}
RABBITMQ=${RABBITMQ:-"rabbitmq.$NETWORK"}

if [ -n "$(docker ps -aq -f name=$NAME)" ]
then
	echo -n "stopping: "
	docker stop -t 1 $NAME
	echo -n "removing: "
	docker rm -f $NAME
fi

if [ -n "$KAZOO_SOURCE" ]
then
	[ ! -e "$KAZOO_SOURCE" ] && echo "Kazoo source tree set to $KAZOO_SOURCE, but not accessible" && exit 1
	KAZOO_SOURCE_VOLUME="-v $KAZOO_SOURCE:/home/user/kazoo"
	echo See \"docker logs $NAME\" output
fi

echo -n "starting: $NAME "
docker run $FLAGS $KAZOO_SOURCE_VOLUME --net $NETWORK -h $NAME --name $NAME --env NETWORK=$NETWORK --env COUCHDB=$COUCHDB --env RABBITMQ=$RABBITMQ \
	--env KAZOO_NODE=kazoo \
	--env KAZOO_APPS=sysconf,blackhole,callflow,cdr,conference,crossbar,fax,hangups,media_mgr,milliwatt,omnipresence,pivot,registrar,reorder,stepswitch,teletype,trunkstore,webhooks,ecallmgr \
	$NETWORK/kazoo
