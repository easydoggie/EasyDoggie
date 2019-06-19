+++
title = "Gitea"
date =  2019-06-18T15:19:32+09:00
weight = 50
tags = ["Gitea"]
+++
[Gitea](https://gitea.io/en-us/)はセルフホストのGitサーバです。

## Giteaのインストール
### ServiceとしてNoadPortを使う場合(デフォルト)
![gitea-loadbalancer](../../img/gitea-ingress.png)
\<release_name\>には任意のリリース名を指定します。
```sh
$ helm install --name <release_name> easydoggie/gitea
```

* デフォルトのServiceタイプはIngress経由でのアクセスを想定しているため、NodePortとして起動します。
* 上記のインストールコマンドではIngress ControllerとIngess Resourceのインストールは行われません。
* Ingress経由でGiteaにアクセスする場合は、別途[Ingressのインストール](nginx-ingress)を行ってください。

### ServiceとしてLoadBalancerを使う場合
![gitea-loadbalancer](../../img/gitea-loadbalancer.png)
Ingressを使わず、ServiceタイプとしてLoadBalancerを使う場合は、setオプションでサービスタイプをLoadBalancerに変更します。
```text
$ helm install --name <release_name> --set service.type=LoadBalancer easydoggie/gitea
```