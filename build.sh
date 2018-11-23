#!/bin/bash
set -x
# Build script for a urbackup docker image
#
# Takes 3 optional positional arguments
#
# Pass "amd64" as 1st argument to build for that architecture. If not given,
# this argument defaults to "armhd"
#
# The second argument is the version number of the server download at
#   https://www.urbackup.org/downloads/Server/
# If not given, this argument defaults to 2.2.11
#
# The 3rd argument specifies the version number to put in the tag on the image.
# If this argument is not given it defaults to the same as the second argument.

ARCH=${1:-armhf}
VERSION=${2:-2.2.11}
TAG_VERSION=${3:-${VERSION}}

docker build --build-arg ARCH=${ARCH} --build-arg VERSION=${VERSION} -t whatang/urbackup:${ARCH}-${TAG_VERSION} .
