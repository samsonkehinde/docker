#!/bin/sh -e
FLAGS=${1:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
IMAGE=${2:-"thecloudpractice/couchdb:master"}
NAME=couchdb.$NETWORK

if [ -n "$(docker ps -aq -f name=$NAME)" ]
then
   echo -n "stopping: "
   docker stop -t 1 $NAME
   echo -n "removing: "
   docker rm -f $NAME
fi
echo -n "starting: $NAME "

docker run $FLAGS --net $NETWORK -h $NAME -p 8081:5984 -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=admin --name $NAME $IMAGE
