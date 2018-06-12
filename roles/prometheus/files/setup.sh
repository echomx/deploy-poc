#!/bin/bash
OS_URL="https://172.24.5.233:8443"
OS_USER="admin"
OS_PWD="Hi_CaaS_20180416"
PROJECT="kube-systems"
NFS_SERVER="172.24.5.236"
NFS_URL="http://172.24.5.236:8080"
HARBOR="harbor.caas.baifendian.com"
HARBOR_USER="admin"
HARBOR_PASSWORD="Harbor_12345$"
NODE="node2"

#create NFS lv
curl -X GET ''${NFS_URL}'/nfs/create?volName=prometheusrule&volSize=2048'
curl -X GET ''${NFS_URL}'/nfs/create?volName=alertmanager&volSize=1024'

# login to Openshift
oc login ${OS_URL} --username=${OS_USER} --password=${OS_PWD} --insecure-skip-tls-verify=true && oc new-project ${PROJECT} 
oc project ${PROJECT}
#grant privileges to mount vlume from host, visit the api of k8s
oadm policy add-cluster-role-to-user cluster-admin system:serviceaccount:kube-systems:default
oadm policy add-scc-to-user privileged system:serviceaccount:kube-systems:default
#create the secret for pulling images
#oc create secret docker-registry deployprometheus -n ${PROJECT} --docker-username=${HARBOR_USER} --docker-password=${HARBOR_PASSWORD} --docker-email="admin@example.com" --docker-server="http://${HARBOR}/"


oc create configmap prometheus-config --from-file=config/prometheus.yml
oc create configmap alertmanager --from-file=config/config.yml

sed "s/{NodeName}/${NODE}/g" template/pods.yml > pods.yml
sed -i "s/{HARBOR}/${HARBOR}/g" pods.yml
sed "s/{NFS_server}/${NFS_SERVER}/g" template/volumes.yml > volumes.yml
cp template/svc.yml ./

oc create -f volumes.yml
sleep 5
oc create -f pods.yml
oc create -f svc.yml

scp alert.rules ${NFS_SERVER}:/nfs/prometheusrule/

