#!/bin/bash
# Setup ArgoCD on OpenShift Container Platform

NAMESPACE="argocd"
PROJECT_URL="https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml"
SERVICE_NAME="${NAMESPACE}-server"
ROUTE_NAME="${NAMESPACE}-route"

echo "Creating new app..."
oc new-project ${NAMESPACE}

echo "Creating project..."
oc apply -f ${PROJECT_URL} -n ${NAMESPACE}

#echo "Configuring loadbalancer..."
#oc patch svc ${SERVICE_NAME} -p '{"spec": {"type": "LoadBalancer"}}' -n #{NAMESPACE}

echo "Creating route..."
oc apply -f ${ROUTE_NAME}.yaml -n ${NAMESPACE}

echo "${ROUTE_NAME} URL..."
echo https://$(oc get routes ${ROUTE_NAME} -o=jsonpath='{ .spec.host }' -n ${NAMESPACE})  

echo "${NAMESPACE} password..."
oc get pods -n ${NAMESPACE} -l app.kubernetes.io/name=${SERVICE_NAME} -o name | cut -d'/' -f 2
