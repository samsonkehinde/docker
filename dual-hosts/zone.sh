#!/bin/sh

read -p "Enter the IP of KAZOO HOST: " KAZOO_IP
RABBITMQ=KAZOO_IP
COUCHDB=KAZOO_IP

export RABBITMQ COUCHDB

../kazoo/run.sh
../freeswitch/run.sh

#../hosts.sh >> /etc/hosts

exit
