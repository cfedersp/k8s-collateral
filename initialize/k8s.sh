#!/bin/sh

NEW_CONFIG_HOME=/home/$1/.kube
kubeadm init --pod-network-cidr='10.45.0.0/16' --service-cidr='10.96.0.0/20' --apiserver-advertise-address="$(hostname -i | cut -d " " -f 2)"  --cri-socket=unix:///var/run/crio/crio.sock
mkdir -p $NEW_CONFIG_HOME
cp -i /etc/kubernetes/admin.conf $NEW_CONFIG_HOME/config
chown $(id -u $1):$(id -g) $NEW_CONFIG_HOME/config

export PORTREADY="nc -zv localhost 6443"
for STATUSCOUNT in $(seq 1 20); do RESULT=$($PORTREADY 2>&1); if [[ $RESULT != *succeeded! ]]; then echo "$STATUSCOUNT $PORTREADY"; sleep 20;  else echo "ready!"; break; fi  done;
export APIREADY="kubectl --kubeconfig /etc/kubernetes/admin.conf get pods -n kube-system -l component=kube-apiserver -o jsonpath='{.items[0].status.containerStatuses[0].ready}'"
for STATUSCOUNT in $(seq 1 20); do RESULT=$($APIREADY); if [[ $RESULT != "'true'" ]]; then echo "$STATUSCOUNT $APIREADY"; sleep 20;  else echo "ready!"; break; fi  done;

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/tigera-operator.yaml
printf -- "- op: replace\n  path: /spec/calicoNetwork/ipPools/0/cidr\n  value: 10.45.0.0/16" > /etc/k8s-manifests/k8s-collateral/calico-kustomize/base/cidr.yaml
kubectl apply -k /etc/k8s-staging/k8s-collateral/calico-kustomize/overlays/demo

