FROM centos:7
MAINTAINER Samson Kehinde <samson.kehinde@cloudpractice.cloud>

RUN yum install -y git curl wget net-tools psmisc ntp epel-release
RUN wget --no-check-certificate https://packages.2600hz.com/centos/7/stable/2600hz-release/4.3/2600hz-release-4.3-0.el7.centos.noarch.rpm
RUN rpm -Uvh 2600hz-release-4.3-0.el7.centos.noarch.rpm

# Clear yum cache
RUN yum clean all

# Setup NTPd
RUN systemctl enable ntpd

# Install Kazoo-wrapped FreeSWITCH
RUN yum-config-manager --disable freeswitch
RUN yum install -y kazoo-freeswitch

# Disable freeswitch bundled systemctl script
RUN systemctl disable freeswitch

# Enable and start FreeSWITCH
RUN systemctl enable kazoo-freeswitch


