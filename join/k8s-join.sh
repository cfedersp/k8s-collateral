#!/bin/sh

/usr/bin/kubeadm join --discovery-file='/etc/kubernetes/bootstrap-kubelet.conf' --cri-socket=unix:///var/run/crio/crio.sock  --apiserver-advertise-address="$MASTER_IP"
