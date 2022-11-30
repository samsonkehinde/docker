#!/bin/sh

read -p "Enter the IP of KAZOO HOST: " KAZOO_IP

export KAZOO_IP

FLAGS=`../hosts.sh`

FLAGS=$FLAGS ../kazoo/run.sh
FLAGS=$FLAGS ../freeswitch/run.sh

exit
