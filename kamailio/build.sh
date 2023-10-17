#!/bin/sh -e
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://github.com/kamailio/kamailio.git"}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}

echo $COMMIT > etc/commit

DOCKER_BUILDKIT=0 docker build $BUILD_FLAGS --build-arg REPO=$REPO --build-arg CONFIG=8afbef27ddb4d0ceb325a993c9f349da7ea5e82a -t $NETWORK/kamailio .
