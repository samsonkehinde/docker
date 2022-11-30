#!/bin/sh -e
FLAGS=${1:-"-td"}
NAME=${NAME:-"monster-ui.kazoo"}

docker ps -aq -f name=$NAME | while read ID; do
        echo -n "stopping: "
        docker stop -t 1 $ID
        echo -n "removing: "
        docker rm -f $ID
done

echo -n "starting: $NAME "

docker run $FLAGS --net host -h $NAME --name $NAME kazoo/monster-ui
