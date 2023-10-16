FROM debian:buster
MAINTAINER Roman Galeev <jamhed@2600hz.com>

# override on run with --env option
ENV NODE_NAME=kazoo
ENV KAZOO_APPS=sysconf,blackhole,callflow,cdr,conference,crossbar,fax,hangups,media_mgr,milliwatt,omnipresence,pivot,registrar,reorder,stepswitch,teletype,trunkstore,webhooks,ecallmgr
ENV COUCHDB=couchdb.$NETWORK
ENV RABBITMQ=rabbitmq.$NETWORK
WORKDIR /opt

# override on build with --build-arg option
ARG REPO=https://github.com/kehindesamson/kazoo.git
ARG SKIP_BUILD
ARG BRANCH
ARG UID
ARG GID

EXPOSE 8000

COPY etc/commit commit

COPY build/setup-os.sh build/setup-os.sh
RUN build/setup-os.sh

