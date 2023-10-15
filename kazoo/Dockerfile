FROM debian:stretch
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
COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY etc/config.ini config.ini

COPY build/cmd.sh ./cmd.sh

COPY build/setup_uid.sh build/setup_uid.sh
USER root
RUN build/setup_uid.sh
#USER user

COPY etc/sys.config sys.config
COPY build/build.sh build/build.sh
RUN build/build.sh

COPY build/config-kazoo.sh build/config-kazoo.sh
RUN build/config-kazoo.sh

COPY build/run.sh run.sh

RUN ln -s /opt/kazoo/core/sup/priv/sup /usr/bin/sup

ENTRYPOINT ./run.sh
