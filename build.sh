#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPT_PATH=`dirname $SCRIPT`
BASE_PATH=`dirname $SCRIPT_PATH`

RETVAL=0
VERSION=3.11.0
SUBVERSION=1
TAG=`date '+%Y%m%d_%H%M%S'`

case "$1" in
	
	download)
		mkdir -p downloads
		wget https://github.com/cdr/code-server/releases/download/v3.11.0/code-server-3.11.0-linux-amd64.tar.gz -O "downloads/code-server-3.11.0-linux-amd64.tar.gz"
	;;
	
	test)
		docker build ./ -t bayrell/alpine_code_server:$VERSION-$SUBVERSION-$TAG --file Dockerfile
	;;
	
	amd64)
		docker build ./ -t bayrell/alpine_code_server:$VERSION-$SUBVERSION-amd64 \
			--file Dockerfile --build-arg ARCH=-amd64
	;;
	
	*)
		echo "Usage: $0 {download|amd64|test}"
		RETVAL=1

esac

exit $RETVAL

