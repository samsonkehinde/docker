#!/bin/sh -e
FLAGS=${1:-"-td"}
IMAGE=${2:-"kazoo/freeswitch"}
NAME=${NAME:-"freeswitch"}
#KAMAILIO=${KAMAILIO:-"kamailio"}
RABBITMQ = ${RABBITMQ:-"rabbitmq-server"}


if [ -n "$(docker ps -aq -f name=$NAME)" ]
then
   echo -n "stopping: "
   docker stop -t 1 $NAME
   echo -n "removing: "
   docker rm -f $NAME
fi

echo -n "starting: $NAME "
docker run $FLAGS --net host --name $NAME -e RABBITMQ=$RABBITMQ $IMAGE

#echo -n "adding dispatcher $NAME to kamailio $KAMAILIO "
# docker exec $KAMAILIO dispatcher_add.sh 1 $NAME
