FROM debian:jessie
MAINTAINER Roman Galeev <jamhed@2600hz.com>

# Install instructions from https://cwiki.apache.org/confluence/display/COUCHDB/Debian

RUN groupadd -r couchdb && useradd -d /var/lib/couchdb -g couchdb couchdb

RUN apt-get update -y && apt-get install -y --no-install-recommends build-essential ca-certificates curl erlang-nox libicu52 libmozjs185-1.0 libnspr4 libnspr4-0d erlang 
RUN rm -rf /var/lib/apt/lists/*

# grab gosu for easy step-down from root and tini for signal handling
RUN gpg --keyserver pgp.mit.edu --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -fSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture)"
RUN curl -o /usr/local/bin/gosu.asc -fSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture).asc"
RUN gpg --verify /usr/local/bin/gosu.asc
RUN rm /usr/local/bin/gosu.asc && chmod +x /usr/local/bin/gosu


RUN gpg --keyserver pgp.mit.edu --recv-keys 6380DC428747F6C393FEACA59A84159D7001A4E5
RUN curl -o /usr/local/bin/tini -fSL "https://github.com/krallin/tini/releases/download/v0.9.0/tini"
RUN curl -o /usr/local/bin/tini.asc -fSL "https://github.com/krallin/tini/releases/download/v0.9.0/tini.asc"
RUN gpg --verify /usr/local/bin/tini.asc
RUN rm /usr/local/bin/tini.asc && chmod +x /usr/local/bin/tini

# https://www.apache.org/dist/couchdb/KEYS
ENV GPG_KEYS \
  15DD4F3B8AACA54740EB78C7B7B7C53943ECCEE1 \
  1CFBFA43C19B6DF4A0CA3934669C02FFDF3CEBA3 \
  25BBBAC113C1BFD5AA594A4C9F96B92930380381 \
  4BFCA2B99BADC6F9F105BEC9C5E32E2D6B065BFB \
  5D680346FAA3E51B29DBCB681015F68F9DA248BC \
  7BCCEB868313DDA925DF1805ECA5BCB7BB9656B0 \
  C3F4DFAEAD621E1C94523AEEC376457E61D50B88 \
  D2B17F9DA23C0A10991AF2E3D9EE01E47852AEE4 \
  E0AF0A194D55C84E4A19A801CDB0C0F904F4EE9B
  
RUN set -xe
RUN for key in $GPG_KEYS; do gpg --keyserver pgp.mit.edu --recv-keys "$key"; done

ENV COUCHDB_VERSION 1.6.1

# download dependencies, compile and install couchdb,
# set correct permissions, expose couchdb to the outside and disable logging to disk
RUN buildDeps='erlang-dev libcurl4-openssl-dev libnspr4-dev erlang-base erlang-nox erlang-eunit'
RUN apt-get update && apt-get install -y --no-install-recommends $buildDeps libmozjs185-dev libicu-dev libcurl4-gnutls-dev libtool


RUN curl -fSL https://archive.apache.org/dist/couchdb/source/$COUCHDB_VERSION/apache-couchdb-$COUCHDB_VERSION.tar.gz -o couchdb.tar.gz
RUN curl -fSL https://archive.apache.org/dist/couchdb/source/$COUCHDB_VERSION/apache-couchdb-$COUCHDB_VERSION.tar.gz.asc -o couchdb.tar.gz.asc

RUN gpg --verify couchdb.tar.gz.asc

RUN mkdir -p /usr/src/couchdb
RUN tar -xzf couchdb.tar.gz -C /usr/src/couchdb --strip-components=1
RUN cd /usr/src/couchdb && ./configure --with-js-lib=/usr/lib --with-js-include=/usr/include/mozjs && make && make install

RUN apt-get purge -y --auto-remove $buildDeps
RUN rm -rf /var/lib/apt/lists/* /usr/src/couchdb /couchdb.tar.gz*

RUN chown -R couchdb:couchdb /usr/local/lib/couchdb /usr/local/etc/couchdb /usr/local/var/lib/couchdb /usr/local/var/log/couchdb /usr/local/var/run/couchdb
RUN chmod -R g+rw /usr/local/lib/couchdb /usr/local/etc/couchdb /usr/local/var/lib/couchdb /usr/local/var/log/couchdb /usr/local/var/run/couchdb

RUN mkdir -p /var/lib/couchdb
RUN sed -e 's/^bind_address = .*$/bind_address = 0.0.0.0/' -i /usr/local/etc/couchdb/default.ini
RUN sed -e 's!/usr/local/var/log/couchdb/couch.log$!/dev/null!' -i /usr/local/etc/couchdb/default.ini

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# Define mountable directories.
# VOLUME ["/usr/local/var/lib/couchdb"]

#EXPOSE 5984
WORKDIR /var/lib/couchdb

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["couchdb"]

COPY etc/local.ini /usr/local/etc/couchdb/local.ini
