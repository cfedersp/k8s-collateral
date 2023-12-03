# k8s-collateral

Prepare release zip:
zip -r k8s-collateral.zip k8s-collateral/ -x k8s-collateral/.git/\*

Inline patch example:
https://stackoverflow.com/questions/69828954/add-environment-variable-to-kubernetes-statefulset-with-kustomize

kustomization.yaml:
namespace: myns

resources:
...

patches:
- patch: |-
    - op: add
      path: "/spec/template/spec/containers/0/env/-"
      value:
        name: MY_ENV2
        value: "2"
  target:
    kind: StatefulSet
    namespace: myns
    name: myapp