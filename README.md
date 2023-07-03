# rpagliuca/my-minikube

## Sobre
Repositório de infra-as-code para aprendizado de Kubernetes, que consiste das seguintes aplicações:
* ArgoCD: gerenciador de aplicações de Kubernetes, que monitora manifestos de um repositório Git (estado desejado) e os aplica automaticamente em nosso cluster
* Bitnami Sealed Secrets: encriptador de senhas de Kubernetes para permitir que sejam controladas via Git
* Golang Basic API: API básica para testes
* Prometheus: queries e alertas para monitorar aplicações cloud
* Grafana: gráficos para monitor aplicações cloud
* Mario Infinite: emulador de Mario jogável via navegador
* Minetest: servidor de alternativa open-source ao Minecraft)
* Serverinfo: aplicação básica que retorna informações sobre o servidor
* Hashicorp Vault: gerenciador de senhas para aplicações cloud

## Como usar
1. Instalar o minikube (ver https://minikube.sigs.k8s.io/docs/start/)
2. Clonar este repositório usando git: `git clone https://github.com/rpagliuca/my-minikube.git`
3. Entrar na pasta do repositório clonado e rodar: `bash setup.sh`

Opcional: instalar `dnsmasq` usando `sudo apt install dnsmasq` e configurá-lo usando o script fornecido por este repositório: `bash setup-dnsmasq.sh`
