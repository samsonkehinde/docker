#!/bin/sh -e

# REPO is global and must be defined on build
echo $REPO
git clone $REPO kazoo

cd kazoo

if [ -z $BRANCH ]
then
	git reset --hard $COMMIT
	git clean -d -f
else
	git fetch origin $BRANCH:build_branch
	git checkout build_branch
	git clean -d -f
fi

