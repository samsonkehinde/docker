#!/bin/sh

read -p "Enter the IP of ZONE HOST: " ZONE_IP
export ZONE_IP

FLAGS=`../hosts.sh`

FLAGS=$FLAGS ../rabbitmq/run.sh
FLAGS=$FLAGS ../couchdb/run.sh
FLAGS=$FLAGS ../kamailio/run.sh
FLAGS=$FLAGS ../monster-ui/run.sh

exit
