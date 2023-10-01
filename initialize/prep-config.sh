#!/bin/bash

NEW_CONFIG_HOME=/home/$1/.kube
mkdir -p $NEW_CONFIG_HOME
cp -i /etc/kubernetes/admin.conf $NEW_CONFIG_HOME/config
chown $(id -u $1):$(id -g) $NEW_CONFIG_HOME/config

if [[ $2 ]]; then aws s3 cp /etc/kubernetes/admin.conf $2; fi

