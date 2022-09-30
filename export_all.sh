#!/bin/bash
#export NETWORK=${NETWORK:-"kazoo"}
docker rmi -f $(docker images | grep "kehindesamson/kazoo" | cut -d' ' -f 1)
./build.sh

docker tag kazoo/couchdb kehindesamson/kazoo:couchdb
docker push kehindesamson/kazoo:couchdb

docker tag kazoo/rabbitmq kehindesamson/kazoo:rabbitmq
docker push kehindesamson/kazoo:rabbitmq

docker tag kazoo/kazoo kehindesamson/kazoo:kazoo
docker push kehindesamson/kazoo:kazoo

docker tag kazoo/kamailio kehindesamson/kazoo:kamailio
docker push kehindesamson/kazoo:kamailio

docker tag kazoo/freeswitch kehindesamson/kazoo:freeswitch
docker push kehindesamson/kazoo:freeswitch

docker tag kazoo/monster-ui kehindesamson/kazoo:monster-ui
docker push kehindesamson/kazoo:monster-ui
