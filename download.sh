#!/bin/bash
docker rmi -f $(docker images | grep "kehindesamson/kazoo" | cut -d' ' -f 1)

docker pull kehindesamson/kazoo:couchdb
docker tag kehindesamson/kazoo:couchdb kazoo/couchdb

docker pull kehindesamson/kazoo:rabbitmq
docker tag kehindesamson/kazoo:rabbitmq kazoo/rabbitmq

docker pull kehindesamson/kazoo:kazoo
docker tag kehindesamson/kazoo:kazoo kazoo/kazoo

docker pull kehindesamson/kazoo:kamailio
docker tag kehindesamson/kazoo:kamailio kazoo/kamailio

docker pull kehindesamson/kazoo:freeswitch
docker tag kehindesamson/kazoo:freeswitch kazoo/freeswitch

docker pull kehindesamson/kazoo:monster-ui
docker tag kehindesamson/kazoo:monster-ui kazoo/monster-ui