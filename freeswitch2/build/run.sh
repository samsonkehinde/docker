#!/bin/sh -e
epmd -daemon
exec freeswitch -nf
