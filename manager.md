apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: manager
spec:
  destination:
    name: ''
    namespace: argocd
    server: https://kubernetes.default.svc
  source:
    path: .
    repoURL: git@github.com:Th3Heavy/argocd
    targetRevision: HEAD
    directory:
      recurse: true
  sources: []
  project: default
  syncPolicy:
    automated:
      prune: false
      selfHeal: true
