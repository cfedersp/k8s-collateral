#!/bin/sh

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/tigera-operator.yaml
printf -- "- op: replace\n  path: /spec/calicoNetwork/ipPools/0/cidr\n  value: 10.45.0.0/16" > /etc/k8s-staging/k8s-collateral/calico-kustomize/base/cidr.yaml
chgrp $1 /etc/k8s-staging/k8s-collateral/calico-kustomize/base/cidr.yaml
kubectl apply -k /etc/k8s-staging/k8s-collateral/calico-kustomize/overlays/demo
kubectl get pods --all-namespaces

