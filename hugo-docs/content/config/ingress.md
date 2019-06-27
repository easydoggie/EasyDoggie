+++
title = "Ingress"
date =  2019-06-20T17:15:40+09:00
weight = 51
tags = ["Ingress", "Nginx Ingress"]
+++

## サービスの構成、初期化方法の変更
以下の表はIngressおよびNGINX Ingressの変更可能なパラーメータとデフォルト値の一覧です。
<div style="font-size:small">

|パラメータ|デフォルト|説明|
|---|---|---|
|`nginx-ingress.controller.service.type`|LoadBalancer|Nginx Ingressのサービスタイプ|
|`ingress.enabled`|true|ingressリソースを有効にする場合はtrue、無効にする場合はfalse|
|`ingress.nginxController`|true|IngressコントローラとしてNginx Ingressを利用する場合はtrue, 利用しない場合はfalse|
|`ingress.annotations`|{}|Ingressのannotaions|
|`ingress.hosts.nginx.host`|easydoggie.example.com|NINGXのホスト名|
|`ingress.hosts.nginx.enabled`|true|NGINXへのアクセスルールを有効にする場合はtrue, 無効にする場合はfalse|
|`ingress.hosts.nginx.serviceName`|nginx|NGINXのService名|
|`ingress.hosts.nginx.servicePort`|80|NGINXのSerivceポート番号|
|`ingress.hosts.gitea.host`|gitea.example.com|Giteaのホスト名|
|`ingress.hosts.gitea.enabled`|true|Giteaへのアクセスルールを有効にする場合はtrue, 無効にする場合はfalse|
|`ingress.hosts.gitea.serviceName`|gitea|GiteaのService名|
|`ingress.hosts.gitea.servicePort`|3000|GiteaのServiceポート番号|
|`ingress.hosts.adminer.host`|adminer.example.com|Adminerのホスト名|
|`ingress.hosts.adminer.enabled`|true|Adminerへのアクセスルールを有効にする場合はtrue, 無効にする場合はfalse|
|`ingress.hosts.adminer.serviceName`|adminer|AdminerのService名|
|`ingress.hosts.adminer.servicePort`|80|AdminerのServiceポート番号|
|`ingress.hosts.kibana.host`|kibana.example.com|Kibanaのホスト名|
|`ingress.hosts.kibana.enabled`|true|Kibanaへのアクセスルールを有効にする場合はtrue, 無効にする場合はfalse|
|`ingress.hosts.kibana.serviceName`|kibana-kibana|KibanaのService名|
|`ingress.hosts.kibana.servicePort`|5601|KibanaのServiceポート番号|
|`ingress.hosts.grafana.host`|grafana.example.com|Grafanaのホスト名|
|`ingress.hosts.grafana.enabled`|true|Grafanaへのアクセスルールを有効にする場合はtrue, 無効にする場合はfalse|
|`ingress.hosts.grafana.serviceName`|grafana|GrafanaのService名|
|`ingress.hosts.grafana.servicePort`|80|GrafanaのServiceポート番号|
|`ingress.hosts.drone.host`|drone.example.com|Droneのホスト名|
|`ingress.hosts.drone.enabled`|true|Droneへのアクセスルールを有効にする場合はtrue, 無効にする場合はfalse|
|`ingress.hosts.drone.serviceName`|drone-drone|DroneのService名|
|`ingress.hosts.drone.servicePort`|80|DroneのServiceポート番号|
|`ingress.tls`|[]|TLS設定|

</div>

## values-false.yaml
`values-false.yaml`は、すべてのIngressルールを無効に設定したValueファイルです。`--set`オプションで個別のルールを有効化して使用します。
```bash
# NGINXのルールだけを有効化した例
$ helm install --name <release_name> -f https://raw.githubusercontent.com/easydoggie/EasyDoggie/master/ingress/ingress/values-false.yaml --set ingress.hosts.nginx.enabled=true easydoggie/ingress
```
> `values-false.yaml`ファイルは、Nginx Ingressも無効化してあります。マネジメントサービスのIngressコントローラの使用もしくはNginx Ingressの有効化を行ってください。