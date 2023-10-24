#!/bin/sh -e
FLAGS=${FLAGS:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
IMAGE=${2:-"thecloudpractice/kazoo"}
read -p 'Hostname: ' NAME
read -p 'Network to add container: ' HOST

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
docker run $FLAGS $KAZOO_SOURCE_VOLUME --net ${HOST:-$NETWORK} -h $NAME -p 8000:8000 -p 5555:5555 --name $NAME --env NETWORK=$NETWORK \
	--env COUCHDB=172.20.0.10 --env RABBITMQ=172.20.0.10 --env KAZOO_NODE=kazoo  --add-host freeswitch01.kazoo:host.docker.internal --add-host host.docker.internal:host-gateway --add-host kaz01.voip.cloudpractoce.cloud:172.20.0.10\
	--env KAZOO_APPS=sysconf,blackhole,callflow,cdr,conference,crossbar,fax,hangups,media_mgr,milliwatt,omnipresence,pivot,registrar,reorder,stepswitch,teletype,trunkstore,webhooks,ecallmgr \
	$IMAGE
