# Install Calico Networking Plugin
1. Start a linux host  with CNI enabled
2. Install Calico configuration
/usr/bin/kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/tigera-operator.yaml
3. Create calico-kustomize/overlays/demo/cidr.yaml - use calico-kustomize/overlays/demo/sample-pod-cidr-replace.yaml as an example
4. Kustomize will download the Calico configuration specified in base/kustomization.yaml. Do not add the operator above to your kustomization.
5. Dry run:
`/usr/bin/kubectl kustomize calico-kustomize/overlays/demo`
6. Enable Calico Networking:
`/usr/bin/kubectl apply -k calico-kustomize/overlays/demo`
