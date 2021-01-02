#!/bin/bash

#set -e
# 自动push到github的main分支 和打tag
# 等hub.docker.com构建完成后，执行最后的输出命令更新k8s

# sh 2build.sh 6.65
imageName="testauto"
deployName="autodemo1"
containersName="testauto"

tagNum=$1
gitTagName="v${tagNum}"
if [[ $tagNum == "" ]];then
	echo "eg: sh build.sh 5.0"
	exit 1
fi

echo $tagNum > version.txt

git add -u
git commit -m "${tagNum}"
git push origin main1
git tag $gitTagName
git push -u origin $gitTagName

echo "kubectl set image deployment/${deployName} ${containersName}=tian0506/testauto:version-${tagNum}"
exit 0



passwd="=yBFdT58?AXGDa&"
echo $tagNum > version.txt

tagname="docker.io/tian0506/${imageName}:${tagNum}"

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o asdfgh main.go
docker build -f Dockerfile -t $tagname .
docker login -u tian0506 -p $passwd

docker push $tagname

kubectl set image deployment/${deployName} ${containersName}=tian0506/testauto:${tagNum}
# sh 2demo-update-deployment.sh $deployName $tagNum 9335 ok
