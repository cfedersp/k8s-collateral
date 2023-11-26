#!/bin/bash
# CRI-o is running but it may not be ready
export CRIOREADY="crictl ps"
for STATUSCOUNT in $(seq 1 10); do RESULT=$($CRIOREADY 2>&1); if [[ $? != 0 ]]; then  echo "$STATUSCOUNT $CRIOREADY"; sleep 40;  else echo "crio ready!"; break; fi  done;

cp /etc/k8s-staging/k8s-collateral/initialize/cluster-config-base.yaml /etc/k8s-staging/k8s-collateral/initialize/cluster-config.yaml
printf "\n  - \"$(hostname -i | cut -d " " -f 2)\"" >> /etc/k8s-staging/k8s-collateral/initialize/cluster-config.yaml
printf "\ncontrolPlaneEndpoint: $(hostname -i | cut -d " " -f 2)" >> /etc/k8s-staging/k8s-collateral/initialize/cluster-config.yaml

/usr/bin/kubeadm init --config /etc/k8s-staging/k8s-collateral/initialize/cluster-config.yaml

