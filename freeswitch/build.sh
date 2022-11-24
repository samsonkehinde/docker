#!/bin/sh -e
REPO=${2:-"https://github.com/signalwire/freeswitch.git"}
# Grab the most recent commit from this repository if no particular commit is requested.
COMMIT=${1:-"$(../bin/get-commit $REPO)"}

echo $COMMIT > etc/commit

docker build $BUILD_FLAGS --build-arg REPO=$REPO -t kazoo/freeswitch .
