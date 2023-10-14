#!/bin/sh -e
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://github.com/kamailio/kamailio.git"}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}

echo $COMMIT > etc/commit

docker build $BUILD_FLAGS --build-arg REPO=$REPO --build-arg CONFIG=63cece75a767b70f385a481b22bd6e5cec384ae5 -t $NETWORK/kamailio .
