#!/bin/sh -e
[ -n "$SKIP_BUILD" ] && exit 0

cd kazoo
cp ../sys.config rel/

cd  
make deps
make compile build-dev-release
