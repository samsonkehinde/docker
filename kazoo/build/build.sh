#!/bin/sh -e
[ -n "$SKIP_BUILD" ] && exit 0

cd kazoo
cp ../sys.config rel/

make compile build-dev-release
