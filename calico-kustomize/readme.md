# Install Calico Networking Plugin
1. Stand up your cluster with CNI enabled
2. Edit calico-kustomize/overlays/demo/cidr.yaml 
3. Kustomize will download the Calico configuration specified in base/kustomization.yaml.
4. Dry run:
`kubectl kustomize calico-kustomize/overlays/demo`
5. Enable Calico Networking:
`kubectl apply -k calico-kustomize/overlays/demo`
