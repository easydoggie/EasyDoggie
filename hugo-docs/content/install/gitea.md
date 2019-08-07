+++
title = "Gitea"
date =  2019-06-18T15:19:32+09:00
weight = 50
tags = ["Gitea"]
+++
[Gitea](https://gitea.io/en-us/)はセルフホストのGitサーバです。

## TL;DR
```console
# NGINX Ingress経由でアクセス
$ helm install easydoggie/ingress
$ helm install easydoggie/gitea
```

```console
# Ingressを使わないでアクセス
$ helm install --set service.type=LoadBalancer easydoggie/gitea
```

## はじめに
* デフォルトのServiceタイプはIngress経由でのアクセスを想定しているため、NodePortとして起動します。
* デフォルトのインストールコマンドではIngress ControllerとIngess Resourceのインストールは行われません。
* Ingress経由でGiteaにアクセスする場合は、別途[Ingressのインストール](../ingress)を行ってください。

## 動作確認環境
* Docker Desktop for Windows (Kubernetes 1.10.11)
* Google Kubernetes Engine (Kubernetes 1.12.8-gke.6)

## Chartのインストール
### ServiceとしてNoadPortを使う場合(デフォルト)
![gitea-loadbalancer](../../img/gitea-ingress.png)
\<release_name\>には任意のリリース名を指定します。
```console
$ helm install --name <release_name> easydoggie/gitea
```

### ServiceとしてLoadBalancerを使う場合
![gitea-loadbalancer](../../img/gitea-loadbalancer.png)
Ingressを使わず、ServiceタイプとしてLoadBalancerを使う場合は、setオプションでサービスタイプをLoadBalancerに変更します。
```console
$ helm install --name <release_name> --set service.type=LoadBalancer easydoggie/gitea
```

## Chartの削除
指定したリリースのデプロイを削除するには`helm delete`コマンドにリリース名を指定します。
```console
$ helm delete <release_name> 
```
リリース名を含めて完全に削除をするには`--purge`オプションを利用します。
```console
$ helm delete --purge <release_name> 
```