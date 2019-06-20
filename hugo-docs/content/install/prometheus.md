+++
title = "Prometheus"
date =  2019-06-17T10:06:18+09:00
weight = 110
tags = ["Prometheus"]
+++

## Prometheus Operatorのインストール
Prometheusはモニタリングのツールです。このチャートでは以下のモニタリングツール一式がインストールされます。

* prometheus-operator
* prometheus
* alertmanager
* node-exporter
* kube-state-metrics
* grafana

### GrafanaのServiceとしてNoadPortを使う場合(デフォルト)
![prometheus-ingress](../../img/prometheus-ingress.png)
```text
$ helm install --name <release_name> easydoggie/prometheus
```
\<release_name\>には任意のリリース名を指定します。

* デフォルトのServiceタイプはIngress経由でのアクセスを想定しているため、NodePortとして起動します。
* 上記のインストールコマンドではIngress ControllerとIngess Resourceのインストールは行われません。
* Ingress経由でGrafanaにアクセスする場合は、別途[Ingressのインストール](nginx-ingress)を行ってください。

### GrafanaのServiceとしてLoadBalancerを使う場合
![prometheus-loadbalancer](../../img/prometheus-loadbalancer.png)
Ingressを使わず、ServiceタイプとしてLoadBalancerを使う場合は、setオプションでサービスタイプをLoadBalancerに変更します。
```text
$ helm install --name <release_name> --set prometheus-operator.grafana.service.type=LoadBalancer easydoggie/prometheus
```