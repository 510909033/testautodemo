#!/bin/sh


# sh 2demo-update-deployment.sh deploymentName tagname NodePortNum
# sh 2demo-update-deployment.sh demohubserver2 4.0 9335

deploymentName=$1
tagname=$2
port=$3
ok=$4
containersName=""
echo "deploymentName=${deploymentName}, tagname=${tagname}, port=${port}"
if [[ $ok != "ok" ]];then
        echo "debug"
        exit 0
fi


exec="kubectl set image deployment/${deploymentName} demohub=tian0506/demohub:${tagname}"
echo $exec
$exec

kubectl get pod

minikube service ${deploymentName}

url=`minikube service ${deploymentName} --url`
echo $url
while true;do
	api="curl $url/version"
	echo $api
	$api
	sleep 1
done
