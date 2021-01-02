#!/bin/sh

# sh 2demo-create-deployment.sh deploymentName tagname NodePortNum
# sh 2demo-create-deployment.sh demohubserver2 4.0 9335

deploymentName=$1
tagname=$2
port=$3
ok=$4
echo "deploymentName=${deploymentName}, tagname=${tagname}, port=${port}"
if [[ $ok != "ok" ]];then
	echo "debug"
	exit 0
fi

exec="kubectl create deployment ${deploymentName} --image=tian0506/demohub:${tagname}"
echo $exec
$exec

exec="kubectl expose deployment ${deploymentName} --type=NodePort --port=${port}"
echo $exec
$exec

kubectl get pod

minikube service ${deploymentName}
