# Setup minikube DNS
sudo sh -c "echo resolv-file=/etc/resolv.dnsmasq.conf > /etc/dnsmasq.d/my-minikube"
sudo sh -c "echo address=/my-minikube.com/$(minikube ip) >> /etc/dnsmasq.d/my-minikube"
sudo sh -c "echo nameserver 8.8.8.8 > /etc/resolv.dnsmasq.conf"
sudo sh -c "echo nameserver 127.0.0.1 > /etc/resolv.conf"
cat /etc/dnsmasq.d/my-minikube
sudo service dnsmasq restart
