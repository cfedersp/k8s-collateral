#!/bin/bash

for HOSTINDEX in $(seq 1 $2); 
do 
# /usr/bin/kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f
#gen-pv-yaml.sh 40Gi /dev/sdf $1-$HOSTINDEX local-storage | /usr/bin/kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f -
./storage/gen-pv-yaml.sh 40Gi $3 $1-$HOSTINDEX local-storage 
printf "\x$(printf %x 65)"
done;

