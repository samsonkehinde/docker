FROM centos:7
MAINTAINER Samson Kehinde <samson.kehinde@cloudpractice.cloud>

# You can find the latest Kazoo Release RPM here: https://packages.2600hz.com/centos/7/stable/2600hz-release/
# Currently, 4.3 is considered 'stable' so:
# https://packages.2600hz.com/centos/7/stable/2600hz-release/4.3/2600hz-release-4.3-0.el7.centos.noarch.rpm

export RELEASE_BASE=https://packages.2600hz.com/centos/7/stable/2600hz-release
export RELEASE_VER=4.3
export META_PKG=2600hz-release-${RELEASE_VER}-0.el7.centos.noarch.rpm
export LATEST_RELEASE=${RELEASE_BASE}/${RELEASE_VER}/${META_PKG}

# Install all system updates
yum update -y

# Install Extra Packages for Enterprise Linux
yum install -y epel-release

# Install required packages
yum install -y yum-utils psmisc

# Clear yum cache
yum clean all

# Setup NTPd
yum install -y ntp
systemctl enable ntpd
systemctl restart ntpd

# Install Kazoo-wrapped FreeSWITCH
yum install -y kazoo-freeswitch

# Disable freeswitch bundled systemctl script
systemctl disable freeswitch

# Enable and start FreeSWITCH
systemctl enable kazoo-freeswitch
systemctl start kazoo-freeswitch

