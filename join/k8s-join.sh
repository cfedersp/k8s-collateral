#!/bin/sh

source /etc/k8s-staging/init.env
source $(aws s3 cp s3://$CONFIG_BUCKET/master-ip.env -)
/usr/bin/kubeadm join --discovery-file='/etc/kubernetes/bootstrap-kubelet.conf' --cri-socket=unix:///var/run/crio/crio.sock  --apiserver-advertise-address="$MASTER_IP"
