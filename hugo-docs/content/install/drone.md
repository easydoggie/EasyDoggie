+++
title = "Drone"
date =  2019-06-18T15:19:05+09:00
weight = 20
tags = ["Drone"]
+++

## Droneのインストール
[Drone](https://drone.io/)はCI/CDを行うためのツールです。  
デフォルトのソースリポジトリはDroneと同じKubernetes上のGiteaを参照します。参照先のリポジトリを変更したい場合は、[Config](../config)のページを参照してください。

### ServiceとしてNoadPortを使う場合(デフォルト)
![drone-ingress](../../img/drone-ingress.png)
```text
$ helm install --name <release_name> easydoggie/drone
```
\<release_name\>には任意のリリース名を指定します。

* デフォルトのServiceタイプはIngress経由でのアクセスを想定しているため、NodePortとして起動します。
* 上記のインストールコマンドではIngress ControllerとIngess Resourceのインストールは行われません。
* Ingress経由でDroneにアクセスする場合は、別途[Ingressのインストール](nginx-ingress)を行ってください。

### ServiceとしてLoadBalancerを使う場合
![drone-loadbalancer](../../img/drone-loadbalancer.png)
Ingressを使わず、ServiceタイプとしてLoadBalancerを使う場合は、setオプションでサービスタイプをLoadBalancerに変更します。
```text
$ helm install --name <release_name> --set drone.service.type=LoadBalancer easydoggie/drone
```