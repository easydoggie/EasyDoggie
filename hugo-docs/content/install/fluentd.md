+++
title = "Fluentd"
date =  2019-06-18T15:19:24+09:00
weight = 40
tags = ["Fluentd"]
+++
Fluentdはログのデータを収集します。  
EasyDoggieでは、Fluentd、Elasticsearch、Kibanaのセットでログを収集する用途で利用することを想定しています。

## Fluentdのインストール
![fluentd](../../img/fluentd.png)
\<release_name\>には任意のリリース名を指定します。
```sh
$ helm install --name <release_name> easydoggie/fluentd
```
デフォルトでは同じKuberneteクラスタ内のElasticsearchに収集したデータを転送します。
転送先の設定などの変更を行う場合は、[設定変更のページ](../config/fkuentd)を参照してください。