#!/bin/sh

read -p "Enter the IP of your RABBITMQ server: " RABBITMQ
read -p "Enter the IP of your COUCHDB server: " COUCHDB

export RABBITMQ=$RABBITMQ
export COUCHDB=$COUCHDB

../kazoo/run.sh
../freeswitch/run.sh
