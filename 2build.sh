#!/bin/bash

#set -e
# 自动push到github

# sh 2build.sh 6.65


git add -u
git commit -m "${tagNum}"
git push origin main
exit 0

imageName="testauto"
deployName="autodemo1"
containersName="testauto"

tagNum=$1
if [[ $tagNum == "" ]];then
	echo "eg: sh build.sh 5.0"
	exit 1
fi

passwd="=yBFdT58?AXGDa&"
echo $tagNum > version.txt

tagname="docker.io/tian0506/${imageName}:${tagNum}"

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o asdfgh main.go
docker build -f Dockerfile -t $tagname .
docker login -u tian0506 -p $passwd

docker push $tagname

kubectl set image deployment/${deployName} ${containersName}=tian0506/testauto:${tagNum}
# sh 2demo-update-deployment.sh $deployName $tagNum 9335 ok
