#!/bin/bash

#set -e

tagNum=$1
if [[ $tagNum == "" ]];then
	echo "eg: sh build.sh 5.0"
	exit 1
fi

passwd="=yBFdT58?AXGDa&"
echo $tagNum > version.txt

tagname="docker.io/tian0506/demohub:${tagNum}"

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o asdfgh main.go
docker build -f Dockerfile -t $tagname .
docker login -u tian0506 -p $passwd

docker push $tagname

sh 2demo-update-deployment.sh demohubserver2 $tagNum 9335 ok
