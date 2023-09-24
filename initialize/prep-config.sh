#!/bin/sh

NEW_CONFIG_HOME=/home/$1/.kube
mkdir -p $NEW_CONFIG_HOME
cp -i /etc/kubernetes/admin.conf $NEW_CONFIG_HOME/config
chown $(id -u $1):$(id -g) $NEW_CONFIG_HOME/config

