#!/bin/bash

MACHINE_IP=`'/mnt/c/Program Files/Docker Toolbox/docker-machine.exe' ls 2>/dev/null | grep default | awk '{ print $5}'`

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="$MACHINE_IP"
export DOCKER_CERT_PATH="/mnt/c/Users/$USER/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"

DOCKER_COMMAND=`echo -n "$@" | sed -E 's/\/mnt\/([a-z])\//\/\/\1\//g'`
eval /usr/bin/docker $DOCKER_COMMAND