+++
title = "Ingress"
date =  2019-06-18T15:20:03+09:00
weight = 51
tags = ["Ingress", "Nginx Ingress"]
+++

## IngressコントローラとしてNginx Ingressを利用する場合
![ingress-nginx-ingress](../../img/ingress-nginx-ingress.png)
デフォルトでは、IngressとNginx Ingressコントローラがインストールされます。
\<release_name\>には任意のリリース名を指定します。
```text
$ helm install --name <release_name> easydoggie/ingress
```

## Ingressだけをインストールする場合
![ingress-ingress](../../img/ingress-ingress.png)
GKEなどIngressコントローラとしてマネジメントLBなどを利用する場合のパターンです。Ingressのみ必要な場合は、setオプションでNginx-Ingressのインストールを禁止設定にします。
```text
$ helm install --name <release_name> --set ingress.nginxController=false easydoggie/ingress
```