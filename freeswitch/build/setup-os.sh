#!/bin/sh -e
#read -p 'Enter Freeswitch Token' TOKEN

apt-get update
apt-get install -y gnupg2 wget lsb-release apt-transport-https ca-certificates libldns-dev cmake
echo "Signalwire Token: ${SW_TOKEN}"
wget --http-user=signalwire --http-password=${SW_TOKEN} -O /usr/share/keyrings/signalwire-freeswitch-repo.gpg https://freeswitch.signalwire.com/repo/deb/debian-release/signalwire-freeswitch-repo.gpg

echo "machine freeswitch.signalwire.com login signalwire password ${SW_TOKEN}" > /etc/apt/auth.conf
echo "deb [signed-by=/usr/share/keyrings/signalwire-freeswitch-repo.gpg] https://freeswitch.signalwire.com/repo/deb/debian-release/ `lsb_release -sc` main" > /etc/apt/sources.list.d/freeswitch.list
echo "deb-src [signed-by=/usr/share/keyrings/signalwire-freeswitch-repo.gpg] https://freeswitch.signalwire.com/repo/deb/debian-release/ `lsb_release -sc` main" >> /etc/apt/sources.list.d/freeswitch.list

apt-get update

# Install dependencies required for the build
apt-get -y build-dep freeswitch
apt-get install -y libg7221-dev

apt-get -y clean
