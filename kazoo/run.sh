#!/bin/sh -e
FLAGS=${FLAGS:-"-td"}
RABBITMQ=${RABBITMQ:-"rabbitmq.kazoo"}
COUCHDB=${COUCHDB:-"couchdb.kazoo"}
NAME=${NAME:-"kazoo.kazoo"}

docker ps -aq -f name=$NAME | while read ID; do
        echo -n "stopping: "
        docker stop -t 1 $ID
        echo -n "removing: "
        docker rm -f $ID
done

if [ -n "$KAZOO_SOURCE" ]
then
	[ ! -e "$KAZOO_SOURCE" ] && echo "Kazoo source tree set to $KAZOO_SOURCE, but not accessible" && exit 1
	KAZOO_SOURCE_VOLUME="-v $KAZOO_SOURCE:/home/user/kazoo"
	echo See \"docker logs $NAME\" output
fi

echo -n "starting: $NAME "
docker run $FLAGS $KAZOO_SOURCE_VOLUME --net="host" -h $NAME --name $NAME -e NETWORK=host -e COUCHDB=$COUCHDB -e RABBITMQ=$RABBITMQ \
	--env KAZOO_NODE=kazoo \
	--env KAZOO_APPS=sysconf,blackhole,callflow,cdr,conference,crossbar,fax,hangups,media_mgr,milliwatt,omnipresence,pivot,registrar,reorder,stepswitch,teletype,trunkstore,webhooks,ecallmgr \
	kazoo/kazoo
