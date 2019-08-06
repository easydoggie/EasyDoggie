+++
title = "Fluentd"
date =  2019-06-18T15:19:24+09:00
weight = 40
tags = ["Fluentd"]
+++
[Fluentd](https://www.fluentd.org/)はログのデータを収集します。  
EasyDoggieでは、Fluentd、Elasticsearch、Kibanaのセットでログを収集する用途で利用することを想定しています。

## 動作確認環境
* Docker Desktop for Windows (Kubernetes 1.10.11)
* Google Kubernetes Engine (Kubernetes 1.12.8-gke.6)

## Chartのインストール
### ServiceとしてClusterIPを使う場合(デフォルト)
![fluentd](../../img/fluentd.png)
Fluentdはローカルでのアクセスのみを想定しているため、サービスタイプはClusterIPとして起動します。
\<release_name\>には任意のリリース名を指定します。
```console
$ helm install --name <release_name> easydoggie/fluentd
```
デフォルトでは同じKuberneteクラスタ内のElasticsearchに収集したデータを転送します。
転送先の設定などの変更を行う場合は、[設定変更のページ](../config/fkuentd)を参照してください。

## Chartの削除
指定したリリースのデプロイを削除するには`helm delete`コマンドにリリース名を指定します。
```console
$ helm delete <release_name> 
```
リリース名を含めて完全に削除をするには`--purge`オプションを利用します。
```console
$ helm delete --purge <release_name> 
```