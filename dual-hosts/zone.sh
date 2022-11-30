#!/bin/sh

read -p "Enter the IP of KAZOO HOST: " KAZOO_IP

export KAZOO_IP

FLAGS = `../hosts.sh`
export $FLAGS

../kazoo/run.sh
../freeswitch/run.sh

exit
