#!/bin/sh -e
[ -n "$SKIP_BUILD" ] && exit 0

#. ./erlang/activate

cd kazoo
cp ../sys.config rel/

make deps
make compile build-dev-release
