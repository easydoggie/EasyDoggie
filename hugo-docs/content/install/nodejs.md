+++
title = "Node.js"
date =  2019-06-14T17:56:55+09:00
weight = 1
tag = ["Node.js"]
+++

## Node.jsのインストール
### ServiceとしてLoadBalancerを使う場合
デフォルトの設定では、Service.type=LoadBalancerとして起動します。
```bash
$ helm install --nama <release_name> easydoggie/node
```
### IngressとNginx Ingressを使う場合
IngressとNginx Ingressを有効にしたマニフェストファイルを指定します。Node.js用のService.typeはNodePortに設定されます。
```bash
$ helm install --name <release_name> \
-f https://raw.githubusercontent.com/easydoggie/EasyDoggie/master/node/node/values-ingress.yaml easydoggie/node
```
### IngressとGKEなどのマネジメントIngressコントローラを使う場合
Ingressを有効にしたマニフェストファイルを指定します。Node.js用のService.typeはNodePortに設定されます。
```bash
作成中
```
  
## Node.jsのアンインストール
完全に消去する場合は、`--purge`オプションを利用します。
```bash
$ helm delete --purge <release_name>
```