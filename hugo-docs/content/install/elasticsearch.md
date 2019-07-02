+++
title = "Elasticsearch"
date =  2019-06-18T15:19:15+09:00
weight = 30
tags = ["Elasticsearch"]
+++

[Elasticsearch](https://www.elastic.co/jp/products/elasticsearch)は分散型RESTful検索/分析エンジンです。  
EasyDoggieでは、Fluentd、Elasticsearch、Kibanaのセットでログを検索/分析する用途で利用することを想定しています。

## 動作確認環境
* Docker Desktop for Windows (Kubernetes 1.10.11)
* Google Kubernetes Engine (Kubernetes 1.12.8-gke.6)

## Chartのインストール
### ServiceとしてClusterIPを使う場合(デフォルト)
![elasticsearch](../../img/elasticsearch.png)
Elasticsearchはローカルでのアクセスのみ想定しているため、サービスタイプはClusterIPとして起動します。
\<release_name\>には任意のリリース名を指定します。
```bash
$ helm install --name <release_name> easydoggie/elasticsearch
```
デフォルトではシングルマスタのノードが起動します。
クラスタのノード数の変更などは、[設定変更のページ](../../config/elasticsearch)を参照してください。

## Chartの削除
指定したリリースのデプロイを削除するには`helm delete`コマンドにリリース名を指定します。
```bash
$ helm delete <release_name> 
```
リリース名を含めて完全に削除をするには`--purge`オプションを利用します。
```bash
$ helm delete --purge <release_name> 
```