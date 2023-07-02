# Boot cluster from scratch:

# Restart minikube
minikube delete
minikube start
minikube addons enable ingress
minikube addons enable ingress-dns

# Apply manual resources
for i in {1..3}; do
    kubectl apply -R -f manually-managed;
    sleep 10;
done;

# Setup minikube DNS
sudo sh -c "echo resolv-file=/etc/resolv.dnsmasq.conf > /etc/dnsmasq.d/my-minikube"
sudo sh -c "echo address=/my-minikube.com/$(minikube ip) >> /etc/dnsmasq.d/my-minikube"
sudo sh -c "echo nameserver 8.8.8.8 > /etc/resolv.dnsmasq.conf"
sudo sh -c "echo nameserver 127.0.0.1 > /etc/resolv.conf"
cat /etc/dnsmasq.d/my-minikube
sudo service dnsmasq restart

# Wait for ArgoCD server
echo Waiting for ArgoCD server to be ready...
kubectl wait --for=condition=ready pod -n argocd -l app.kubernetes.io/name=argocd-server

# Wait until secret is ready
# while ! kubectl get secret -n argocd argocd-initial-admin-secret; do sleep 1; done;
echo ArgoCD app URL: http://argocd.my-minikube.com
echo ArgoCD password:; ( kubectl get secret -n argocd argocd-initial-admin-secret -o json | jq .data.password -r | base64 -d )
