#!/bin/sh -e
CONFIG=${CONFIG:-"master"}
git clone https://github.com/2600hz/kazoo-configs-kamailio.git kazoo-configs
cd kazoo-configs
git reset --hard $CONFIG
cd ../
