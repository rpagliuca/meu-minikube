# Boot cluster from scratch:

# Restart minikube
minikube delete
minikube start
minikube addons enable ingress
# minikube addons enable ingress-dns

# Apply manual resources
for i in {1..3}; do
    kubectl apply -R -f manually-managed;
    sleep 10;
done;

# Wait for ArgoCD server
echo Waiting for ArgoCD server to be ready...
kubectl wait --for=condition=ready pod -n argocd -l app.kubernetes.io/name=argocd-server

# Wait until secret is ready
echo "ArgoCD app URL (requer configuração prévia do dnsmasq): http://argocd.my-minikube.com"
echo ArgoCD password:; ( kubectl get secret -n argocd argocd-initial-admin-secret -o json | jq .data.password -r | base64 -d )
echo
echo
echo "Instruções extras caso você não tenha o dnsmasq configurado:"
echo "1. Rode o comando :kubectl port-forward -n argocd svc/argocd-server 8080:80"
echo "2. Acesse via browser: localhost:8080"
