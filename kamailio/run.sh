#!/bin/sh -e
FLAGS=${1:-"-td"}
NAME=${NAME:-"kamailio"}

# Request for the IP of RabbitMQ to use for this Kamailio Instance.
read -p "Enter RabbitMQ IP:" RABBITMQ

if [ -n "$(docker ps -aq -f name=$NAME)" ]
then
   echo -n "stopping: "
   docker stop -t 1 $NAME
   echo -n "removing: "
   docker rm -f $NAME
fi
echo -n "starting: $NAME "

docker run $FLAGS --net host --name $NAME --env RABBITMQ=$RABBITMQ kazoo/kamailio
