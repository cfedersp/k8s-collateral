#!/bin/sh

kubeadm init --pod-network-cidr='10.45.0.0/16' --service-cidr='10.96.0.0/20' --apiserver-advertise-address="$(hostname -i | cut -d " " -f 2)"  --cri-socket=unix:///var/run/crio/crio.sock

