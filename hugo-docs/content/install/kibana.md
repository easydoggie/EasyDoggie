+++
title = "Kibana"
date =  2019-06-18T15:19:39+09:00
weight = 60
tags = ["Kibana"]
+++
[Kibana](https://www.elastic.co/jp/products/kibana)はデータを可視化するツールです。  
EasyDoggieでは、Fluentd、Elasticsearch、Kibanaのセットでログを可視化する用途で利用することを想定しています。

## Kibanaのインストール
### ServiceとしてNoadPortを使う場合(デフォルト)
![kibana-loadbalancer](../../img/kibana-ingress.png)
\<release_name\>には任意のリリース名を指定します。
```sh
$ helm install --name <release_name> easydoggie/kibana
```

* デフォルトのServiceタイプはIngress経由でのアクセスを想定しているため、NodePortとして起動します。
* 上記のインストールコマンドではIngress ControllerとIngess Resourceのインストールは行われません。
* Ingress経由でKibanaにアクセスする場合は、別途[Ingressのインストール](nginx-ingress)を行ってください。

### ServiceとしてLoadBalancerを使う場合
![kibana-loadbalancer](../../img/kibana-loadbalancer.png)
Ingressを使わず、ServiceタイプとしてLoadBalancerを使う場合は、setオプションでサービスタイプをLoadBalancerに変更します。
```text
$ helm install --name <release_name> --set kibana.service.type=LoadBalancer easydoggie/kibana
```