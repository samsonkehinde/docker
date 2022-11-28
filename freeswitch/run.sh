#!/bin/sh -e
FLAGS=${1:-"-td"}
IMAGE=${2:-"kazoo/freeswitch"}
NAME=${NAME:-"freeswitch.kazoo"}
RABBITMQ=${RABBITMQ:-"127.0.0.1"}

while read ID; do
	echo -n "stopping: "
	docker stop -t 1 ID
	echo -n "removing: "
	docker rm -f ID
done < docker ps -aq -f name=$NAME

echo -n "starting: $NAME "
docker run $FLAGS --net host --name $NAME -e RABBITMQ=$RABBITMQ $IMAGE

