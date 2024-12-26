apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: app-of-apps
spec:
  destination:
    name: ''
    namespace: argocd
    server: https://kubernetes.default.svc
  source:
    path: apps
    repoURL: git@github.com:Th3Heavy/argocd
    targetRevision: HEAD
    directory:
      recurse: true
  sources: []
  project: default
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
