#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <resource-group-name> <aks-cluster-name>"
    exit 1
fi

# Assign arguments to variables
RESOURCE_GROUP_NAME=$1
AKS_CLUSTER_NAME=$2

# Create AKS cluster
az aks create \
    --location southeastasia \
    --resource-group $RESOURCE_GROUP_NAME \
    --name $AKS_CLUSTER_NAME \
    --node-count 1 \
    --os-sku Ubuntu \
    --generate-ssh-keys \
    --kubernetes-version 1.30.0 \
    --load-balancer-sku standard \
    --enable-vpa \
    --network-plugin azure 
    # --enable-aad \
    # --enable-azure-rbac \

az aks update \
    --name $AKS_CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP_NAME \
    --enable-disk-driver \
    --enable-file-driver \
    --enable-blob-driver \
    --enable-snapshot-controller

# Add node pool
az aks nodepool add \
    --resource-group $RESOURCE_GROUP_NAME \
    --name workerpool1 \
    --cluster-name $AKS_CLUSTER_NAME \
    --node-count 2 \
    --os-sku Ubuntu

az aks get-credentials -g $RESOURCE_GROUP_NAME -n $AKS_CLUSTER_NAME

# kubectl auth can-i get pods -n action --as system:serviceaccount:action:adminns-sa