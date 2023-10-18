#!/bin/sh -e
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://github.com/kamailio/kamailio.git"}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}

echo $COMMIT > etc/commit

DOCKER_BUILDKIT=0 docker build $BUILD_FLAGS --build-arg REPO=$REPO --build-arg CONFIG=0fbe7cf6a4efbb2addc9dc218509dfb1fc52df2a -t thecloudpractice/kamailio .
