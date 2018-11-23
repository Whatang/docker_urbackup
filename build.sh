#!/bin/bash
set -x
ARCH=${1:-armhf}
VERSION=${2:-2.2.11}
TAG_VERSION=${3:-${VERSION}}

docker build --build-arg ARCH=${ARCH} --build-arg VERSION=${VERSION} -t whatang/urbackup:${ARCH}-${TAG_VERSION} .
