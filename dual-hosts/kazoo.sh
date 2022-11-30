#!/bin/sh

read -p "Enter the IP of ZONE HOST: " ZONE_IP
export ZONE_IP

../rabbitmq/run.sh
../couchdb/run.sh
../kamailio/run.sh
../monster-ui/run.sh

../hosts.sh >> /etc/hosts

exit
