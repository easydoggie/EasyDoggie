+++
title = "Nginx"
date =  2019-06-18T15:19:52+09:00
weight = 80
tags = ["Nginx", "Nginx Unit"]
+++

## Nginxのインストール
* デフォルトのServiceタイプはIngress経由でのアクセスを想定しているため、NodePortとして起動します。
* 以下のインストールコマンドではIngress ControllerとIngess Resourceのインストールは行われません。
* Ingress経由でAdminerにアクセスする場合は、別途[Ingressのインストール](nginx-ingress)を行ってください。

### NginxとNginx Unitをインストールする場合(デフォルト)
![nginx-ingress](../../img/nginx-ingress.png)
デフォルトでは、NginxとNginx Unitがインストールされます。
\<release_name\>には任意のリリース名を指定します。
```sh
$ helm install --name <release_name> easydoggie/nginx
```

### Nginxのみインストールする場合
![nginx-nounit](../../img/nginx-nounit.png)
Nginx Unitが不要な場合は、setオプションでNginx Unitのインストールを禁止にします。
```
$ helm install --name <release_name> --set appServer.enabled=false easydoggie/nginx
```

### ServiceとしてLoadBalancerを使う場合
![nginx-loadbalancer](../../img/nginx-loadbalancer.png)
Ingressを使わず、ServiceタイプとしてLoadBalancerを使う場合は、setオプションでサービスタイプをLoadBalancerに変更します。
```text
$ helm install --name <release_name> --set service.type=LoadBalancer easydoggie/nginx
```