#!/bin/sh -e
COUCHDB_VERSION=3.0.0
curl -fSL https://archive.apache.org/dist/couchdb/source/$COUCHDB_VERSION/apache-couchdb-$COUCHDB_VERSION.tar.gz -o couchdb.tar.gz
curl -fSL https://archive.apache.org/dist/couchdb/source/$COUCHDB_VERSION/apache-couchdb-$COUCHDB_VERSION.tar.gz.asc -o couchdb.tar.gz.asc

gpg --verify couchdb.tar.gz.asc

mkdir -p /usr/src/couchdb
tar -xzf couchdb.tar.gz -C /usr/src/couchdb --strip-components=1
cd /usr/src/couchdb && ./configure --with-js-lib=/usr/lib --with-js-include=/usr/include/mozjs && make && make install

apt-get purge -y --auto-remove $buildDeps
rm -rf /var/lib/apt/lists/* /usr/src/couchdb /couchdb.tar.gz*

chown -R couchdb:couchdb /usr/local/lib/couchdb /usr/local/etc/couchdb /usr/local/var/lib/couchdb /usr/local/var/log/couchdb /usr/local/var/run/couchdb
chmod -R g+rw /usr/local/lib/couchdb /usr/local/etc/couchdb /usr/local/var/lib/couchdb /usr/local/var/log/couchdb /usr/local/var/run/couchdb

mkdir -p /var/lib/couchdb
sed -e 's/^bind_address = .*$/bind_address = 0.0.0.0/' -i /usr/local/etc/couchdb/default.ini
sed -e 's!/usr/local/var/log/couchdb/couch.log$!/dev/null!' -i /usr/local/etc/couchdb/default.ini
