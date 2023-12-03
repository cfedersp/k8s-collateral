#!/bin/sh

/usr/bin/kubectl create --kubeconfig /etc/kubernetes/admin.conf -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/tigera-operator.yaml
printf -- "- op: replace\n  path: /spec/calicoNetwork/ipPools/0/cidr\n  value: 10.45.0.0/20" > /etc/k8s-staging/k8s-collateral/networking/tigera-kustomize/base/cidr.yaml
chgrp $1 /etc/k8s-staging/k8s-collateral/networking/tigera-kustomize/base/cidr.yaml
/usr/bin/kubectl apply --kubeconfig /etc/kubernetes/admin.conf -k /etc/k8s-staging/k8s-collateral/networking/tigera-kustomize/overlays/demo
/usr/bin/kubectl get pods --kubeconfig /etc/kubernetes/admin.conf --all-namespaces

