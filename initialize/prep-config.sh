#!/bin/bash -x

NEW_CONFIG_HOME=/home/$1/.kube
mkdir -p $NEW_CONFIG_HOME
cp -i /etc/kubernetes/admin.conf $NEW_CONFIG_HOME/config
chown $(id -u $1):$(id -g) $NEW_CONFIG_HOME/config

if [[ $2 ]]; then aws s3 cp /etc/kubernetes/admin.conf $2; fi
curl -s http://169.254.169.254/latest/meta-data/local-ipv4 | { echo -n MASTER_IP=; cat; } | aws s3 cp - s3://baremetal-k8s-no-eks-west-kubernetesconfigbucket-fryh6zd70bj2/master-ip.env
