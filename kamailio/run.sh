#!/bin/sh -e
FLAGS=${1:-"-td"}
NETWORK=${NETWORK:-"host"}
NAME=${NAME:-"kamailio.$NETWORK"}
KAZOO=${KAZOO:-"kazoo.$NETWORK"}

if [ -n "$(docker ps -aq -f name=$NAME)" ]
then
   echo -n "stopping: "
   docker stop -t 1 $NAME
   echo -n "removing: "
   docker rm -f $NAME
fi
echo -n "starting: $NAME "

docker run $FLAGS --net $NETWORK -h $NAME -p 5060:5060 -p 7000:7000 --name $NAME --env RABBITMQ=${RABBITMQ:-"rabbitmq.$NETWORK"} kazoo/kamailio
