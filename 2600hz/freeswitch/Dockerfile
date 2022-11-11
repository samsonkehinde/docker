FROM centos:7
MAINTAINER Samson Kehinde <samson.kehinde@cloudpractice.cloud>

# You can find the latest Kazoo Release RPM here: https://packages.2600hz.com/centos/7/stable/2600hz-release/
# Currently, 4.3 is considered 'stable' so:
# https://packages.2600hz.com/centos/7/stable/2600hz-release/4.3/2600hz-release-4.3-0.el7.centos.noarch.rpm

RUN export RELEASE_BASE=https://packages.2600hz.com/centos/7/stable/2600hz-release
RUN export RELEASE_VER=4.3
RUN export META_PKG=2600hz-release-${RELEASE_VER}-0.el7.centos.noarch.rpm
RUN export LATEST_RELEASE=${RELEASE_BASE}/${RELEASE_VER}/${META_PKG}

# Install all system updates
RUN yum update -y

# Install Extra Packages for Enterprise Linux
RUN yum install -y wget epel-release yum-utils

RUN cd /usr/src && wget --no-check-certificate https://packages.2600hz.com/centos/7/stable/2600hz-release/4.2/2600hz-release-4.2-0.el7.centos.noarch.rpm && \
rpm -Uvh 2600hz-release-4.2-0.el7.centos.noarch.rpm

RUN yum-config-manager --disable 2600hz-experimental
RUN yum-config-manager --disable 2600hz-staging
RUN yum-config-manager --enable 2600hz-stable

# Clear yum cache
RUN yum clean all

# Setup NTPd
RUN yum install -y ntp
RUN systemctl enable ntpd

# Install Kazoo-wrapped FreeSWITCH
RUN yum install -y kazoo-freeswitch

# Disable freeswitch bundled systemctl script
RUN systemctl disable freeswitch

# Enable and start FreeSWITCH
RUN systemctl enable kazoo-freeswitch


