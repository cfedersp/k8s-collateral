#!/bin/sh

/usr/bin/kubectl apply --kubeconfig /etc/kubernetes/admin.conf -k /etc/k8s-staging/k8s-collateral/networking/calico-kustomize/overlays/demo