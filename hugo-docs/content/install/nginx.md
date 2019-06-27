+++
title = "NGINX, NGINX Unit"
date =  2019-06-18T15:19:52+09:00
weight = 80
tags = ["NGINX", "NGINX Unit"]
+++

[NGINX](https://www.nginx.com/)は、オープンソースのWebサーバです。[NGINX Unit](https://www.nginx.com/)は、複数言語に対応しているアプリケーションサーバです。デフォルトでは1つのPod内にNGINXとNGINX Unitのコンテナが起動します。

## TL;DR
```bash
# NGINXとNGINX Unitをインストールして、NGINX Ingress経由でアクセス
$ helm install easydoggie/ingress
$ helm install easydoggie/nginx
```

```bash
# NGINXだけインストールして、NGINX Ingress経由でアクセス
$ helm install easydoggie/ingress
$ helm install --set appServer.enabled=false easydoggie/nginx
```

```bash
# Ingressを使わないでアクセス
$ helm install --set service.type=LoadBalancer easydoggie/nginx
```

## はじめに
* デフォルトのServiceタイプはIngress経由でのアクセスを想定しているため、NodePortとして起動します。
* 以下のインストールコマンドではIngress ControllerとIngess Resourceのインストールは行われません。
* Ingress経由でNginxにアクセスする場合は、別途[Ingressのインストール](../ingress)を行ってください。

## 動作確認環境
* Docker Desktop for Windows (Kubernetes 1.10.11)
* Google Kubernetes Engine (Kubernetes 1.12.8-gke.6)

## Chartのインストール
### NGINXとNGINX Unitをインストールする場合(デフォルト)
![nginx-ingress](../../img/nginx-ingress.png)
デフォルトでは、NGINXとNGINX Unitがインストールされます。
\<release_name\>には任意のリリース名を指定します。
```bash
$ helm install --name <release_name> easydoggie/nginx
```
> NGINXおよびNGINX Unitの設定値は、デフォルトの値が設定されます。設定値を変更する場合は、[NGINXの設定変更](../../config/nginx)または[NGINX Unitの設定変更](../../config/nginxunit)を参照してください。

### Nginxのみインストールする場合
![nginx-nounit](../../img/nginx-nounit.png)
Nginx Unitが不要な場合は、setオプションでNginx Unitのインストール設定を`false`にします。
\<release_name\>には任意のリリース名を指定します。
```bash
$ helm install --name <release_name> --set appServer.enabled=false easydoggie/nginx
```
> NGINXの設定値は、デフォルトの値が設定されます。設定値を変更する場合は、[NGINXの設定変更](../../config/nginx)を参照してください。

### ServiceとしてLoadBalancerを使う場合
![nginx-loadbalancer](../../img/nginx-loadbalancer.png)
Ingressを使わず、ServiceタイプとしてLoadBalancerを使う場合は、setオプションでサービスタイプをLoadBalancerに変更します。
\<release_name\>には任意のリリース名を指定します。
```bash
$ helm install --name <release_name> --set service.type=LoadBalancer easydoggie/nginx
```
> NGINXおよびNGINX Unitの設定値は、デフォルトの値が設定されます。設定値を変更する場合は、[NGINXの設定変更](../../config/nginx)または[NGINX Unitの設定変更](../../config/nginxunit)を参照してください。

## Chartの削除
指定したリリースのデプロイを削除するには`helm delete`コマンドにリリース名を指定します。
```bash
$ helm delete <release_name> 
```
リリース名を含めて完全に削除をするには`--purge`オプションを利用します。
```bash
$ helm delete --purge <release_name> 
```