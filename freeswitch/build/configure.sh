#!/bin/sh -e

cd freeswitch

# Enable mod_kazoo legacy events 
sed -i "s/kazoo_globals.legacy_events = SWITCH_FALSE;/kazoo_globals.legacy_events = SWITCH_TRUE;/g" src/mod/event_handlers/mod_kazoo/kazoo_ei_config.c

# Enable the debugging of the messages sent between kazoo and freeswitch
sed -i '1,10s/^/#define EI_DEBUG\r\n/' src/mod/event_handlers/mod_kazoo/mod_kazoo.h

./bootstrap.sh -j
./configure
