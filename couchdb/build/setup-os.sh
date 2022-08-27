#!/bin/sh -e
# Install instructions from https://cwiki.apache.org/confluence/display/COUCHDB/Debian

groupadd -r couchdb
useradd -d /var/lib/couchdb -g couchdb couchdb

apt-get update -y
apt-get install -y --no-install-recommends build-essential ca-certificates curl erlang-nox libicu-dev libmozjs185-dev gnupg dirmngr erlang
rm -rf /var/lib/apt/lists/*

# grab gosu for easy step-down from root and tini for signal handling
gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys "B42F6819007F00F88E364FD4036A9C25BF357DD4"
curl -o /usr/local/bin/gosu -fSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture)"
curl -o /usr/local/bin/gosu.asc -fSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture).asc"
gpg --verify /usr/local/bin/gosu.asc
rm /usr/local/bin/gosu.asc
chmod +x /usr/local/bin/gosu


gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys "6380DC428747F6C393FEACA59A84159D7001A4E5"
curl -o /usr/local/bin/tini -fSL "https://github.com/krallin/tini/releases/download/v0.9.0/tini"
curl -o /usr/local/bin/tini.asc -fSL "https://github.com/krallin/tini/releases/download/v0.9.0/tini.asc"
gpg --verify /usr/local/bin/tini.asc
rm /usr/local/bin/tini.asc
chmod +x /usr/local/bin/tini

# https://www.apache.org/dist/couchdb/KEYS
export GPG_KEYS="15DD4F3B8AACA54740EB78C7B7B7C53943ECCEE1 1CFBFA43C19B6DF4A0CA3934669C02FFDF3CEBA3 25BBBAC113C1BFD5AA594A4C9F96B92930380381 4BFCA2B99BADC6F9F105BEC9C5E32E2D6B065BFB 5D680346FAA3E51B29DBCB681015F68F9DA248BC 7BCCEB868313DDA925DF1805ECA5BCB7BB9656B0 C3F4DFAEAD621E1C94523AEEC376457E61D50B88 D2B17F9DA23C0A10991AF2E3D9EE01E47852AEE4 E0AF0A194D55C84E4A19A801CDB0C0F904F4EE9B"
  
set -xe
for key in $GPG_KEYS; do gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys "$key"; done

buildDeps='erlang-dev erlang-base erlang-nox erlang-eunit'
apt-get update
apt-get install -y --no-install-recommends $buildDeps
