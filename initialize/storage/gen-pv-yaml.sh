#!/bin/sh

HOSTNAME=$(hostname)
CAP=$1
DEVICE=$2
STORAGE_CLASS=$3
LOGICAL_NAME=$4
cat << EOF
apiVersion: v1
kind: PersistentVolume
metadata:
  name: $LOGICAL_NAME
spec:
  capacity:
    storage: $CAP
  volumeMode: Filesystem
  accessModes:
  - ReadWriteOnce
  persistentVolumeReclaimPolicy: Delete
  storageClassName: $STORAGE_CLASS
  local:
    path: $DEVICE
  nodeAffinity:
    required:
      nodeSelectorTerms:
      - matchExpressions:
        - key: name
          operator: In
          values:
            - $HOSTNAME
