#!/bin/sh -e
## Set node name - Need to do this on startup
MY_HOSTNAME=$(hostname)
sed -i 's/name couchdb@127.0.0.1/name $MY_HOSTNAME/g' /opt/couchdb/etc/vm.args

##Set cookie (for intra-cluster communication):
sed -i 's/setcookie monster/setcookie cloudpractice/g' /opt/couchdb/etc/vm.args

exec couchdb