#!/bin/sh -e
FLAGS=${1:-"-td"}
IMAGE=${2:-"kazoo/freeswitch"}
NETWORK=${NETWORK:-"kazoo"}
NAME=${NAME:-"freeswitch.$NETWORK"}
KAMAILIO=${KAMAILIO:-"kamailio.$NETWORK"}

if [ -n "$(docker ps -aq -f name=$NAME)" ]
then
   echo -n "stopping: "
   docker stop -t 1 $NAME
   echo -n "removing: "
   docker rm -f $NAME
fi

echo -n "starting: $NAME "
docker run $FLAGS --net $NETWORK -h $NAME -p 8021:8021 -p 8031:8031 -p 11000:11000 -e 8021 --name $NAME --env RABBITMQ=${RABBITMQ:-"rabbitmq.$NETWORK"} $IMAGE

echo -n "adding dispatcher $NAME to kamailio $KAMAILIO "
docker exec $KAMAILIO dispatcher_add.sh 1 $NAME
