Créer un fichier secret avec le pwd encodé en base64
ex:
apiVersion: v1
data:
  secretKey: xxxx==
kind: Secret
metadata:
  name: tinyauth
  namespace: tinyauth
type: Opaque



# This is the important bit:
kubeseal --controller-name=sealed-secrets --controller-namespace=kube-system --format=yaml -f secrettmp.yaml > secret.yaml
# At this point mysealedsecret.json is safe to upload to Github,
# post on Twitter, etc.

# Eventually:
kubectl create -f mysealedsecret.json

# Profit!
kubectl get secret mysecret