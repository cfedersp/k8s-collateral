#!/bin/bash
# CRI-o is running but it may not be ready
export CRIOREADY="crictl ps"
for STATUSCOUNT in $(seq 1 10); do RESULT=$($CRIOREADY 2>&1); if [[ $? != 0 ]]; then  echo "$STATUSCOUNT $CRIOREADY"; sleep 40;  else echo "crio ready!"; break; fi  done;
            
/usr/bin/kubeadm init --pod-network-cidr='10.45.0.0/16' --service-cidr='10.96.0.0/20' --apiserver-advertise-address="$(hostname -i | cut -d " " -f 2)"  --cri-socket=unix:///var/run/crio/crio.sock

