#!/bin/bash
VERSION=${1:-latest}
NAME=whatang/urbackup
export DOCKER_CLI_EXPERIMENTAL=enabled
set -x
docker manifest create --amend ${NAME}:${VERSION} ${NAME}:armhf-${VERSION} ${NAME}:amd64-${VERSION}
docker manifest annotate ${NAME}:${VERSION} ${NAME}:armhf-${VERSION} --arch arm
docker manifest push -p ${NAME}:${VERSION}
