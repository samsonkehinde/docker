FROM debian:buster
MAINTAINER Samson Kehinde <samson.kehinde@cloudpractice.cloud>

USER root

ARG REPO=https://github.com/signalwire/freeswitch.git freeswitch
ARG CONFIG=master
ARG TOKEN

ENV SW_TOKEN=$TOKEN

COPY build/setup-os.sh build/setup-os.sh
RUN build/setup-os.sh

COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY etc/commit commit

COPY build/setup-commit.sh build/setup-commit.sh
RUN build/setup-commit.sh

COPY etc/modules.conf freeswitch/modules.conf

COPY build/configure.sh build/configure.sh
RUN build/configure.sh

COPY build/build.sh build/build.sh
RUN build/build.sh

COPY build/setup-config.sh build/setup-config.sh
RUN build/setup-config.sh

COPY build/install.sh build/install.sh
RUN build/install.sh

RUN ln -s "/usr/local/freeswitch/bin/fs_cli" /usr/bin/fs_cli

WORKDIR "/usr/local/freeswitch"

COPY build/run.sh run.sh

#USER freeswitch
USER root

ENTRYPOINT [ "./run.sh" ]
