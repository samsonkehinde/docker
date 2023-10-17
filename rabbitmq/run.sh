#!/bin/sh -e
FLAGS=${1:-"-td"}
NETWORK=${NETWORK:-"kazoo"} 
IMAGE=thecloudpractice/rabbitmq:master
NAME=rabbitmq.$NETWORK

if [ -n "$(docker ps -aq -f name=$NAME)" ]
then
	echo -n "stopping: "
	docker stop -t 1 $NAME
	echo -n "removing: "
	docker rm -f $NAME
fi

echo -n "starting: $NAME "
docker run $FLAGS --net $NETWORK -h $NAME -p 8080:15672 --name $NAME $IMAGE
