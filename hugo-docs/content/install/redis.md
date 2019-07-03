+++
title = "Redis"
date =  2019-06-18T15:20:15+09:00
weight = 120
tags = ["Redis"]
+++

Redisはインメモリのデータストアです。  
シングルマスタもしくはマスタ/スレーブ構成のRedisをインストールすることができます。

## 動作確認環境
* Docker Desktop for Windows (Kubernetes 1.10.11)
* Google Kubernetes Engine (Kubernetes 1.12.8-gke.6)

## Chartのインストール
### Master-Slave構成（デフォルト）
![redis-masterslave](../../img/redis-masterslave.png)
デフォルトではマスター x 1、スレーブ x 2のPodが起動します。データの永続化領域としてEmptyDirを利用します。
\<release_name\>には任意のリリース名を指定します。
```bash
$ helm install --name <release_name> easydoggie/redis
```
スレーブのノード数の変更などは、[設定変更のページ](../config/redis)を参照してください。

### Masterのみの構成
![redis-master](../../img/redis-master.png)
マスター1台のみの構成です。`--set`オプションでクラスタの利用を`false`に設定します。データの永続化領域としてEmptyDirを利用します。
```bash
$ helm install --name <release_name> --set redis.cluster.enabled=false easydoggie/redis
```

## Chartの削除
指定したリリースのデプロイを削除するには`helm delete`コマンドにリリース名を指定します。
```bash
$ helm delete <release_name> 
```
リリース名を含めて完全に削除をするには`--purge`オプションを利用します。
```bash
$ helm delete --purge <release_name> 
```