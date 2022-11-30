#!/bin/sh

export RABBITMQ=${RABBITMQ:-"rabbitmq.kazoo"}
export COUCHDB=${COUCHDB:-"rabbitmq.couchdb"}

../kazoo/run.sh
../freeswitch/run.sh

../hosts.sh >> /etc/hosts

exit
