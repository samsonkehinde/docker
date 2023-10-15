#!/bin/sh -e
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://github.com/signalwire/freeswitch.git"}
# Grab the most recent commit from this repository if no particular commit is requested.
COMMIT=${1:-"$(../bin/get-commit $REPO)"}

echo $COMMIT > etc/commit

DOCKER_BUILDKIT=0 docker build $BUILD_FLAGS --build-arg TOKEN=$SW_TOKEN --build-arg REPO=$REPO -t $NETWORK/freeswitch .
