#!/bin/bash
#export NETWORK=${NETWORK:-"kazoo"}
docker rmi -f $(docker images | grep "thecloudpractice" | cut -d' ' -f 1)
./build.sh

docker push thecloudpractice/couchdb

docker push thecloudpractice/rabbitmq

docker push thecloudpractice/kazoo

docker push thecloudpractice/kamailio

docker push thecloudpractice/freeswitch

docker push thecloudpractice/monster-ui
