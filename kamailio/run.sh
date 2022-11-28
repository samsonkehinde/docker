#!/bin/sh -e
FLAGS=${1:-"-td"}
NAME=${NAME:-"kamailio.kazoo"}

# Request for the IP of RabbitMQ to use for this Kamailio Instance.
read -p "Enter RabbitMQ IP:" RABBITMQ

docker ps -aq -f name=$NAME | while read ID; do
        echo -n "stopping: "
        docker stop -t 1 $ID
        echo -n "removing: "
        docker rm -f $ID
done

echo -n "starting: $NAME "

#docker run $FLAGS --net host --name $NAME --add-host=rabbitmq-server:$RABBITMQ kazoo/kamailio
docker run $FLAGS --net host -h $NAME --name $NAME -e RABBITMQ=$RABBITMQ kazoo/kamailio
