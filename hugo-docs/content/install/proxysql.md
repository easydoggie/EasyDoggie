+++
title = "Proxysql"
date =  2019-07-04T12:03:17+09:00
weight = 111
tags = ["ProxySQL"]
+++

[ProxySQL](https://proxysql.com/)はMySQLのプロキシです。GPLライセンスとして利用することができます。指定したクエリのルールに従って、ReadとWriteのクエリをMySQLサーバに振り分けます。アプリケーション側でMaster、Slaveのサーバ構成やフェイルオーバーを意識する必要がなくなり、DBの管理が簡単になります。
同様のMySQLプロキシとしてMaxScaleがあります。MaxScaleにはライセンス制限があるため、EasyDoggieではProxySQLを採用しています。

## 動作確認環境
* Docker Desktop for Windows (Kubernetes 1.10.11)
* Google Kubernetes Engine (Kubernetes 1.12.8-gke.6)

## Chartのインストール
![proxysql](../../img/proxysql.png)
```bash
$ helm install --name <release_name> easydoggie/proxysql
```
\<release_name\>には任意のリリース名を指定します。MySQLの接続先の設定などは、[設定変更のページ](../../config/proxysql)を参照してください。

## Chartの削除
指定したリリースのデプロイを削除するには`helm delete`コマンドにリリース名を指定します。
```bash
$ helm delete <release_name> 
```
リリース名を含めて完全に削除をするには`--purge`オプションを利用します。
```bash
$ helm delete --purge <release_name> 
```