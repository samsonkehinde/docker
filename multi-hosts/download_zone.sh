#!/bin/bash
docker rmi -f $(docker images | grep "kehindesamson/kazoo" | cut -d' ' -f 1)

docker pull kehindesamson/kazoo:kazoo
docker tag kehindesamson/kazoo:kazoo kazoo/kazoo

docker pull kehindesamson/kazoo:freeswitch
docker tag kehindesamson/kazoo:freeswitch kazoo/freeswitch

