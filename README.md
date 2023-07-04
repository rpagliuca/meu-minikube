# rpagliuca/meu-minikube

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
2. Clonar este repositório usando git: `git clone https://github.com/rpagliuca/meu-minikube.git`
3. Entrar na pasta do repositório clonado e rodar: `bash setup.sh`
4. Acessar a aplicação ArgoCD (ver seção abaixo sobre `port-forward` ou sobre `dnsmasq`)

## Opcional: abrir aplicação ArgoCD via `port-forward`
1. Rodar `kubectl port-forward -n argocd svc/argocd-server 80:8080`
2. Acessar via browser `http://localhost:8080`
3. O mesmo procedimento pode ser feito para rodas as diferentes aplicações (fazendo port-forward do nome do serviço e portas apropriados)

## Opcional: instalar `dnsmasq` para acessar todas as aplicações via endereços próprios

1. Em distribuições baseadas em Debian, rode: `sudo apt install dnsmasq`
2. Rode o script `bash setup-dnsmasq.sh` fornecido junto com este repositório

O script `setup-dnsmasq.sh` configura o `dnsmasq` para direcionar todas as URLs com `meu-minikube.com` para o IP do minikube. Assim, fica possível acessar os seguintes endereços diretamente pelo navegador:

* http://argocd.meu-minikube.com
* http://prometheus.meu-minikube.com
* http://grafana.meu-minikube.com
* http://mario.meu-minikube.com
* http://serverinfo.meu-minikube.com
