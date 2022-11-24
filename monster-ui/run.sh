#!/bin/sh -e
FLAGS=${1:-"-td"}
NAME=monster-ui.$NETWORK

read -p "Enter Kazoo Server IP:" KAZOO

if [ -n "$(docker ps -aq -f name=$NAME)" ]
then
   echo -n "stopping: "
   docker stop -t 1 $NAME
   echo -n "removing: "
   docker rm -f $NAME
fi
echo -n "starting: $NAME "

docker run $FLAGS --net host --name $NAME kazoo/monster-ui -e KAZOO=$KAZOO
