+++
title = "Adminer"
date =  2019-06-18T15:18:56+09:00
weight = 10
tags = ["Adminer"]
+++
## Adminerのインストール
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

### ServiceとしてNoadPortを使う場合(デフォルト)
![adminer-ingress](../../img/adminer-ingress.png)
```text
$ helm install --name <release_name> easydoggie/adminer
```
\<release_name\>には任意のリリース名を指定します。

* デフォルトのServiceタイプはIngress経由でのアクセスを想定しているため、NodePortとして起動します。
* 上記のインストールコマンドではIngress ControllerとIngess Resourceのインストールは行われません。
* Ingress経由でAdminerにアクセスする場合は、別途[Ingressのインストール](nginx-ingress)を行ってください。

### ServiceとしてLoadBalancerを使う場合
![adminer-loadbalancer](../../img/adminer-loadbalancer.png)
Ingressを使わず、ServiceタイプとしてLoadBalancerを使う場合は、setオプションでサービスタイプをLoadBalancerに変更します。
```text
$ helm install --name <release_name> --set service.type=LoadBalancer easydoggie/adminer
```