#!/bin/sh -e
git clone --depth 1 --no-single-branch https://github.com/2600hz/kazoo-sounds
cp -a kazoo-sounds/freeswitch /usr/share/freeswitch/sounds
