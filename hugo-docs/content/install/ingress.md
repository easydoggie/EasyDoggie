+++
title = "Ingress"
date =  2019-06-18T15:20:03+09:00
weight = 51
tags = ["Ingress", "Nginx Ingress"]
+++

外部（インターネット）からのアクセス経路としてIngressを利用する場合に設定します。

## はじめに
* デフォルトではEasyDoggieとして設定している、すべてのルールがIngressリソースに設定されます。
* Ingressリソースのルールを有効もしくは無効にするには、[Ingressの設定](../../config/ingress)を参照してください。
* GKEなどのマネージドKubernetes環境でIngressを利用する場合は、ファイアウォールの接続許可が必要な場合があります。

## 動作確認環境
* Docker Desktop for Windows (Kubernetes 1.10.11)
* Google Kubernetes Engine (Kubernetes 1.12.8-gke.6)

## Chartのインストール
### IngressコントローラとしてNginx Ingressを利用する場合
![ingress-nginx-ingress](../../img/ingress-nginx-ingress.png)
デフォルトでは、IngressとNginx Ingressコントローラがインストールされます。
\<release_name\>には任意のリリース名を指定します。
```bash
$ helm install --name <release_name> easydoggie/ingress
```

### Ingressだけをインストールする場合
![ingress-ingress](../../img/ingress-ingress.png)
GKEなどIngressコントローラとしてマネジメントLBなどを利用する場合のパターンです。Ingressのみ必要な場合は、`--set`オプションでNginx-Ingressのインストールをfalseに設定にします。
```bash
$ helm install --name <release_name> --set ingress.nginxController=false easydoggie/ingress
```
Nginx IngressおよびすべてのIngressルールを無効化したvalues.yamlを利用することもできます。必要なルールは`--set`オプションで有効にすることができます。  
以下は、Nginxのルールのみ有効にした実行例です。
```bash
$ helm install --name <release_name> -f https://raw.githubusercontent.com/easydoggie/EasyDoggie/master/ingress/ingress/values-false.yaml --set ingress.hosts.nginx.enabled=true easydoggie/ingress
```
## Chartの削除
指定したリリースのデプロイを削除するには`helm delete`コマンドにリリース名を指定します。
```bash
$ helm delete <release_name> 
```
リリース名を含めて完全に削除をするには`--purge`オプションを利用します。
```bash
$ helm delete --purge <release_name> 
```