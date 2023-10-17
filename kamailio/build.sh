#!/bin/sh -e
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://github.com/kamailio/kamailio.git"}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}

echo $COMMIT > etc/commit

DOCKER_BUILDKIT=0 docker build $BUILD_FLAGS --build-arg REPO=$REPO --build-arg CONFIG=47838e03eb23fb57b7f86bf27c02ce79476c503d -t thecloudpractice/kamailio .
