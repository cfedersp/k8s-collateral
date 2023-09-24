#!/bin/bash

export PORTREADY="nc -zv localhost 6443"
for STATUSCOUNT in $(seq 1 20); do RESULT=$($PORTREADY 2>&1); if [[ $RESULT != *succeeded! ]]; then echo "$STATUSCOUNT $PORTREADY"; sleep 20;  else echo "local port open!"; break; fi  done;
export APIREADY="kubectl --kubeconfig /etc/kubernetes/admin.conf get pods -n kube-system -l component=kube-apiserver -o jsonpath='{.items[0].status.containerStatuses[0].ready}'"
for STATUSCOUNT in $(seq 1 20); do RESULT=$($APIREADY); if [[ $RESULT != "'true'" ]]; then echo "$STATUSCOUNT $APIREADY"; sleep 20;  else echo "kubectl ready!"; break; fi  done;

