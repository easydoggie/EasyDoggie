+++
title = "Adminer"
date =  2019-06-18T15:18:56+09:00
weight = 10
tags = ["Adminer"]
+++

[Adminer](https://www.adminer.org/)はデータベースの管理ツールです。phpMyAdminの代替として利用することができます。
対応しているデータベースは以下の通りです。

* MySQL
* MariaDB
* PostgreSQL
* SQLite
* MS SQL
* Oracle
* Firebird
* SimpleDB
* Elasticsearch
* MongoDB

## TL;DR
```bash
# NGINX Ingress経由でアクセス
$ helm install easydoggie/ingress
$ helm install easydoggie/adminer
```

```bash
# Ingressを使わないでアクセス
$ helm install --set service.type=LoadBalancer easydoggie/adminer
```

## はじめに
* デフォルトのServiceタイプはIngress経由でのアクセスを想定しているため、NodePortとして起動します。
* 上記のインストールコマンドではIngress ControllerとIngess Resourceのインストールは行われません。
* Ingress経由でAdminerにアクセスする場合は、別途[Ingressのインストール](../ingress)を行ってください。

## 動作確認環境
* Docker Desktop for Windows (Kubernetes 1.10.11)
* Google Kubernetes Engine (Kubernetes 1.12.8-gke.6)

## Chartのインストール
### ServiceとしてNoadPortを使う場合(デフォルト)
![adminer-ingress](../../img/adminer-ingress.png)
```bash
$ helm install --name <release_name> easydoggie/adminer
```
\<release_name\>には任意のリリース名を指定します。

### ServiceとしてLoadBalancerを使う場合
![adminer-loadbalancer](../../img/adminer-loadbalancer.png)
Ingressを使わず、ServiceタイプとしてLoadBalancerを使う場合は、setオプションでサービスタイプをLoadBalancerに変更します。
```bash
$ helm install --name <release_name> --set service.type=LoadBalancer easydoggie/adminer
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