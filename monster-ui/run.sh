#!/bin/sh -e
FLAGS=${1:-"-td"}
NETWORK=${NETWORK:-"host"}
IMAGE=${2:-"thecloudpractice/monster-ui"}
NAME=monster-ui.$NETWORK

if [ -n "$(docker ps -aq -f name=$NAME)" ]
then
   echo -n "stopping: "
   docker stop -t 1 $NAME
   echo -n "removing: "
   docker rm -f $NAME
fi
echo -n "starting: $NAME "

docker run $FLAGS --net $NETWORK -h $NAME --name $NAME $IMAGE
#docker run $FLAGS --net $NETWORK -h $NAME -p 3000:3000 --name $NAME kazoo/monster-ui
