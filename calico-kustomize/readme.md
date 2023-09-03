# Install Calico Networking Plugin
1. Stand up your cluster with CNI enabled
2. Install Calico configuration
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/tigera-operator.yaml
3. Edit calico-kustomize/overlays/demo/cidr.yaml 
4. Kustomize will download the Calico configuration specified in base/kustomization.yaml. Do not add the operator above to your kustomization.
5. Dry run:
`kubectl kustomize calico-kustomize/overlays/demo`
6. Enable Calico Networking:
`kubectl apply -k calico-kustomize/overlays/demo`
