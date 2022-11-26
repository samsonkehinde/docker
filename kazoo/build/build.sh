#!/bin/sh -e
[ -n "$SKIP_BUILD" ] && exit 0
#. /home/user/erlang/activate

cd kazoo
cp ../sys.config rel/

make compile build-dev-release
