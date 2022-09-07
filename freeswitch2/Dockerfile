FROM debian:stretch
MAINTAINER Samson Kehinde <samson.kehinde@cloudpractice.cloud>

USER root

COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY build/install.sh build/install.sh
RUN build/install.sh

COPY build/setup-config.sh build/setup-config.sh
RUN build/setup-config.sh

WORKDIR "/usr/share/freeswitch"

## Ports
# Open the container up to the world.
# Event Socket Port
EXPOSE 8021/tcp
# Sip - Internal/External Profile
EXPOSE 5060/tcp 5060/udp 5080/tcp 5080/udp
# Tls - Internal/External Profile
EXPOSE 5061/tcp 5061/udp 5081/tcp 5081/udp
# WebSocket Signaling ports.
EXPOSE 7443/tcp
# 
EXPOSE 5070/udp 5070/tcp
# media ports.
EXPOSE 64535-65535/udp
EXPOSE 16384-32768/udp

COPY build/run.sh run.sh
ENTRYPOINT [ "./run.sh" ]
