+++
title = "Redis"
date =  2019-06-18T15:20:15+09:00
weight = 120
tags = ["Redis"]
+++

Redisはインメモリのデータストアです。  
シングルマスタもしくはマスタ/スレーブ構成のRedisをインストールすることができます。
![redis](../../img/redis.png)

## Redisのインストール
\<release_name\>には任意のリリース名を指定します。
```sh
$ helm install --name <release_name> easydoggie/redis
```
デフォルトではマスター x 1、スレーブ x 2のコンテナが起動します。
![redis-containers](../../img/redis-containers.png)
スレーブのノード数の変更などは、[設定変更のページ](../config/redis)を参照してください。