#!/bin/bash -x

NEW_CONFIG_HOME=/home/$1/.kube
mkdir -p $NEW_CONFIG_HOME
cp -i /etc/kubernetes/admin.conf $NEW_CONFIG_HOME/config
chown $(id -u $1):$(id -g) $NEW_CONFIG_HOME/config

if [[ $2 ]]; then aws s3 cp /etc/kubernetes/admin.conf s3://$2/config; fi
curl -s http://169.254.169.254/latest/meta-data/local-ipv4 | { echo -n MASTER_IP=; cat; } | aws s3 cp - s3://$2/master-ip.env
aws s3 cp /var/lib/kubelet/config.yaml s3://$2/
aws s3 cp /etc/kubernetes/pki/ca.crt s3://$2/
aws s3 cp /var/lib/kubelet/kubeadm-flags.env s3://$2/
