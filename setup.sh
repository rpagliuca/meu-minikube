# Boot cluster from scratch:

# One-liner
minikube delete; minikube start; minikube addons enable ingress; for i in {1..3}; do kubectl apply -R -f manually-managed; sleep 3; done; minikube ip; while ! kubectl get secret -n argocd argocd-initial-admin-secret; do sleep 1; done;

# Setup minikube DNS
sudo sh -c "echo resolv-file=/etc/resolv.dnsmasq.conf > /etc/dnsmasq.d/my-minikube"
sudo sh -c "echo address=/my-minikube/$(minikube ip) >> /etc/dnsmasq.d/my-minikube"
sudo sh -c "echo nameserver 8.8.8.8 > /etc/resolv.dnsmasq.conf"
sudo sh -c "echo nameserver 127.0.0.1 > /etc/resolv.conf"
cat /etc/dnsmasq.d/my-minikube
sudo service dnsmasq restart

echo ArgoCD app URL: http://argocd.my-minikube
echo ArgoCD password:; ( kubectl get secret -n argocd argocd-initial-admin-secret -o json | jq .data.password -r | base64 -d ); echo;
