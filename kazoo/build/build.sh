#!/bin/sh -e
[ -n "$SKIP_BUILD" ] && exit 0

cd kazoo
cp ../sys.config rel/

make deps
make compile build-dev-release
