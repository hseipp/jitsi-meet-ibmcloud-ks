#!/bin/sh
#
# Copyright 2020- hseipp. All rights reserved
# SPDX-License-Identifier: Apache2.0
#

# CHANGE these variables
SECRET_JICOFO_COMP="some_random_text"
SECRET_JICOFO_AUTH="<some_random_text"
SECRET_JVB_AUTH="<some_random_text>"
CLUSTER_NAME="my-iks-cluster"
# Get zones for free clusters with "ibmcloud ks zone ls --provider classic"
ZONE="fra05"

echo -n "Logging into your IBM Cloud Account"
ibmcloud login -g Default
# Deploy IKS cluster
echo -n "Deploying IKS cluster"
ibmcloud ks cluster create classic --zone $ZONE --name $CLUSTER_NAME
# wait for cluster to become ready
STATE="notready"
while [ $STATE != "normal" ]; do
    STATE=`ibmcloud ks cluster ls --output json | jq -r '.[0].state'`
    echo -n "."
    sleep 5
done
echo "Done!"
CLUSTER_ID=`ibmcloud ks cluster ls --output json | jq -r '.[0].id'`
ibmcloud ks cluster config --cluster $CLUSTER_ID
# Show cluster details
ibmcloud ks cluster get --cluster $CLUSTER_NAME

EXTERNAL_IP=`kubectl get nodes -o json | jq -r '.items[0].metadata.labels."ibm-cloud.kubernetes.io/external-ip"'`
EXTERNAL_IP_DNS=`nslookup $EXTERNAL_IP | grep name | awk '{print $4}' | sed -e 's/.$//g'`

# Install Jitsi
kubectl create ns jitsi
git clone https://github.com/jitsi/docker-jitsi-meet
cd docker-jitsi-meet/examples/kubernetes
sed -i "s/<Set the address for any node in the cluster here>/$EXTERNAL_IP/g" deployment.yaml
sed -i "s|value: America/Los_Angeles|value: Europe/Berlin|g" deployment.yaml
kubectl create secret generic jitsi-config -n jitsi --from-literal=JICOFO_COMPONENT_SECRET=$SECRET_JICOFO_COMP --from-literal=JICOFO_AUTH_PASSWORD=$SECRET_JICOFO_AUTH --from-literal=JVB_AUTH_PASSWORD=$SECRET_JVB_AUTH
kubectl create -f jvb-service.yaml 
kubectl create -f deployment.yaml 
kubectl config set-context $(kubectl config current-context) --namespace=jitsi
kubectl expose deployment jitsi --type="NodePort" --port=443

PORT=`kubectl get service jitsi -o json | jq '.spec.ports[0].nodePort'`
echo Installation ready - now navigate to "https://$EXTERNAL_IP_DNS:$PORT" to access your Jitsi Meet server
