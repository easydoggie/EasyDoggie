+++
title = "Nginx Ingress"
date =  2019-06-18T15:20:03+09:00
weight = 90
tags = ["Nginx Ingress"]
+++

## Nginx Ingressのインストール
IngressとNginx Ingressコントローラがインストールされます。
\<release_name\>には任意のリリース名を指定します。
```sh
$ helm install --name <release_name> easydoggie/nginx-ingress
```
GKEなどIngressのみ必要な場合は、values.yamlの設定を変更します。
```
作成中
```