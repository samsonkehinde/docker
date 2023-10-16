#!/bin/sh -e
[ -n "$SKIP_BUILD" ] && exit 0

. ./erlang/activate

cp ../sys.config rel/

cd kazoo
make deps
make compile build-dev-release
