+++
title = "Drone"
date =  2019-06-18T15:19:05+09:00
weight = 20
tags = ["Drone"]
+++

[Drone](https://drone.io/)はCI/CDを行うためのツールです。  
デフォルトのソースリポジトリはDroneと同じKubernetes上のGiteaを参照します。参照先のリポジトリを変更したい場合は、[Config](../config)のページを参照してください。

## TL;DR
```bash
# NGINX Ingress経由でアクセス
$ helm install easydoggie/ingress
$ helm install easydoggie/drone
```

```bash
# Ingressを使わないでアクセス
$ helm install --set drone.service.type=LoadBalancer easydoggie/drone
```

## はじめに
* デフォルトのServiceタイプはIngress経由でのアクセスを想定しているため、NodePortとして起動します。
* 上記のインストールコマンドではIngress ControllerとIngess Resourceのインストールは行われません。
* Ingress経由でDroneにアクセスする場合は、別途[Ingressのインストール](../ingress)を行ってください。

## 動作確認環境
* Docker Desktop for Windows (Kubernetes 1.10.11)
* Google Kubernetes Engine (Kubernetes 1.12.8-gke.6)

## Chartのインストール
### ServiceとしてNoadPortを使う場合(デフォルト)
![drone-ingress](../../img/drone-ingress.png)
```bash
$ helm install --name <release_name> easydoggie/drone
```
\<release_name\>には任意のリリース名を指定します。

### ServiceとしてLoadBalancerを使う場合
![drone-loadbalancer](../../img/drone-loadbalancer.png)
Ingressを使わず、ServiceタイプとしてLoadBalancerを使う場合は、setオプションでサービスタイプをLoadBalancerに変更します。
```bash
$ helm install --name <release_name> --set drone.service.type=LoadBalancer easydoggie/drone
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