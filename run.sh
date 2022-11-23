#!/bin/sh
EXPORT NETWORK=host
rabbitmq/run.sh
couchdb/run.sh

kazoo/run.sh
kamailio/run.sh

monster-ui/run.sh
