#!/bin/sh

#move to script directory so all relative paths work
cd "$(dirname "$0")"

if [ ."$switch_branch" = "master" ]; then
		switch/source-master.sh
	else
		switch/source-release.sh
	fi

	#copy the switch conf files to /etc/freeswitch
	switch/conf-copy.sh

	#set the file permissions
	#switch/source-permissions.sh
	switch/package-permissions.sh

	#systemd service
	#switch/source-systemd.sh
	switch/package-systemd.sh
