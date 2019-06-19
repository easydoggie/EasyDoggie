+++
title = "Node.js"
date =  2019-06-14T17:56:55+09:00
weight = 100
tags = ["Node.js"]
+++

## Node.jsのインストール
### ServiceとしてLoadBalancerを使う場合
デフォルトの設定では、Service.type=LoadBalancerとして起動します。
![nodejs_loadbalancer](../../img/nodejs_loadbalancer.png)
```bash
$ helm install --nama <release_name> easydoggie/node
```
### IngressとNginx Ingressを使う場合
IngressコントローラとしてNginx Ingressを使うパターンです。
IngressとNginx Ingressを有効にしたマニフェストファイルを指定します。Node.js用のService.typeはNodePortに設定されます。また、ingress.kubernetes.io/ingress.classがnginxに指定されます。
![nodejs_nginx_ingress](../../img/nodejs_nginx_ingress.png)
```bash
$ helm install --name <release_name> \
-f https://raw.githubusercontent.com/easydoggie/EasyDoggie/master/node/node/values-nginx-ingress.yaml easydoggie/node
```
### IngressとGKEなどのマネジメントIngressコントローラを使う場合
IngressコントローラとしてGKEなどのマネジメントロードバランサーを使うパターンです。
Ingressを有効にしたマニフェストファイルを指定します。Node.js用のService.typeはNodePortに設定されます。
![nodejs_ingress](../../img/nodejs_ingress.png)
```bash
$ helm install --name <release_name> \
-f https://raw.githubusercontent.com/easydoggie/EasyDoggie/master/node/node/values-ingress.yaml easydoggie/node
```