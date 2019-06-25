+++
title = "Webap"
date =  2019-06-24T10:44:29+09:00
weight = 10
+++

## WebAPサーバ(Web3層構成)
### 目次

* [ローカル開発環境](#ローカル開発環境)
* [ステージング/本番環境](#ステージング-本番環境)

### ローカル開発環境
![web3tier](../../img/web3tier.png)
ローカルの開発環境を想定した構成です。すべての構成をKubernetes上にインストールします。

|構成要素|内容|
|---|---|
|Ingress Controller|Nginx Ingress|
|Web|Nginx|
|AP|Nginx Unit|
|DB|MySQL|

```plain
$ helm install --name ingress easydoggie/ingress
$ helm install --name nginx easydoggie/nginx
$ helm install --name mysql easydoggie/mysql
```
WebとAPは同じPodで構成されているため、1つのHelmチャート(easydoggie/nginx)でインストールされます。

### ステージング/本番環境
![web3tier_prd](../../img/web3tier_prd.png)
GCPなどのパブリッククラウドでの利用を想定した構成です。Ingressコントローラとデータベースは、パブリッククラウドのマネジメントサービスを利用します。以下はGCPでの構成例です。

|構成要素|内容 |
|---|---|
|Ingress Controller|Cloud LoadBalancing|
|web|Nginx|
|AP|Nginx Unit|
|DB|Cloud SQL|

```plain
$ helm install --name nginx easydoggie/nginx
$ helm install --name ingress -f https://raw.githubusercontent.com/easydoggie/EasyDoggie/master/ingress/ingress/values-web.yaml easydoggie/ingress
```

* Cloud LoadBalancingはIngressのインストールで作成されます。
* Cloud SQLは自動では起動しません。gcloudもしくはコンソールからサービスを作成してください。