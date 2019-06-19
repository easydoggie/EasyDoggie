+++
title = "Elasticsearch"
date =  2019-06-18T15:19:15+09:00
weight = 30
tags = ["Elasticsearch"]
+++

[Elasticsearch](https://www.elastic.co/jp/products/elasticsearch)は分散型RESTful検索/分析エンジンです。  
EasyDoggieでは、Fluentd、Elasticsearch、Kibanaのセットでログを検索/分析する用途で利用することを想定しています。

## Elasticsearchのインストール
![elasticsearch](../../img/elasticsearch.png)
\<release_name\>には任意のリリース名を指定します。
```sh
$ helm install --name <release_name> easydoggie/elasticsearch
```
デフォルトではシングルマスタのノードが起動します。
クラスタのノード数の変更などは、[設定変更のページ](../config/elasticsearch)を参照してください。