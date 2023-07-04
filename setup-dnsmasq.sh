# Setup minikube DNS
sudo sh -c "echo resolv-file=/etc/resolv.dnsmasq.conf > /etc/dnsmasq.d/meu-minikube"
sudo sh -c "echo address=/meu-minikube.com/$(minikube ip) >> /etc/dnsmasq.d/meu-minikube"
sudo sh -c "echo nameserver 8.8.8.8 > /etc/resolv.dnsmasq.conf"
sudo sh -c "echo nameserver 127.0.0.1 > /etc/resolv.conf"
cat /etc/dnsmasq.d/meu-minikube
sudo service dnsmasq restart
