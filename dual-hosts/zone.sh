#!/bin/sh

read -p "Enter the IP of KAZOO HOST: " KAZOO_IP

export KAZOO_IP

../kazoo/run.sh
../freeswitch/run.sh

#../hosts.sh >> /etc/hosts

exit
