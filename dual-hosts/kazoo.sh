#!/bin/sh

../rabbitmq/run.sh
../couchdb/run.sh
../kamailio/run.sh
../monster-ui/run.sh

../hosts.sh >> /etc/hosts

exit
