+++
title = "Mysql"
date =  2019-06-17T10:17:05+09:00
weight = 5
+++

## シングルマスター構成
マスター x 1、スレーブ x 0の構成例です。スレーブを利用しない場合は、`replication.enabled`の値を`false`に設定します。

```yml
# file: mysql/mysql/values
mysql:
  db:
    name: testdb
  root:
    password: easydoggie
  replication:
    enabled: false
```

|接続先|ホスト|ポート|
|:----|:----|----|
|Master|\<helm_name\>-mysql|3306|

## マスター、スレーブ構成
マスター x 1、スレーブ x 2の構成例です。スレーブを利用する場合は、`replication.enabled`を`true`に設定します。スレーブのノード数は、`slave.replicas`で設定します。

``` yaml
# file: mysql/mysql/values
mysql:
  db:
    name: testdb
  root:
    password: easydoggie
  replication:
    enabled: true
  slave:
    replicas: 2
```

|接続先|ホスト|ポート|
|:----|:----|----|
|Master|\<helm_name\>-mysql|3306|
|Slave|\<helm_name\>-mysql-slave|3306|

## マスター、スレーブの切り離し間隔を調整する
マスター、スレーブのPodをServiceから切り離す時間を調整します。デフォルトでは以下のヘルスチェック間隔と連続失敗回数を満たすと、Serviceから切り離されます。

|node|ヘルスチェック間隔(秒)|失敗回数|
|----|----:|----:|
|Master|10|3|
|Slave|10|3|

``` bash
$ kubectl describe pods/mysql-mysql-master-0|grep Readiness:
    Readiness:      exec [sh -c exec mysqladmin status -uroot -p$MYSQL_ROOT_PASSWORD] delay=30s timeout=1s period=10s #success=1 #failure=3
$ kubectl describe pods/mysql-mysql-slave-0|grep Readiness:
    Readiness:      exec [sh -c exec mysqladmin status -uroot -p$MYSQL_MASTER_ROOT_PASSWORD] delay=30s timeout=1s period=10s #success=1 #failure=3
```

以下の例では、マスター、スレーブともに5秒間隔 x 5回のヘルスチェック失敗に設定を変更します。

``` yaml
# file: mysql/mysql/values
mysql:
  db:
    name: testdb
  root:
    password: easydoggie
  replication:
    enabled: true
  master:
    readinessProbe:
      periodSeconds: 5
      failureThreshold: 5
  slave:
    replicas: 1
    readinessProbe:
      periodSeconds: 5
      failureThreshold: 5
```

``` bash
$ kubectl describe pods/mysql-mysql-master-0|grep Readiness:
    Readiness:      exec [sh -c exec mysqladmin status -uroot -p$MYSQL_ROOT_PASSWORD] delay=30s timeout=1s period=5s #success=1 #failure=5
$ kubectl describe pods/mysql-mysql-slave-0|grep Readiness:
    Readiness:      exec [sh -c exec mysqladmin status -uroot -p$MYSQL_MASTER_ROOT_PASSWORD] delay=30s timeout=1s period=5s #success=1 #failure=5
```

## マスター、スレーブの再起動間隔を調整する
マスター、スレーブのPodを再起動する間隔を調整します。デフォルトでは以下のヘルスチェック間隔と連続失敗回数を満たすと、Podの再起動が行われます。

|node|ヘルスチェック間隔(秒)|失敗回数|
|----|----:|----:|
|Master|10|3|
|Slave|10|3|

``` bash
$ kubectl describe pods/mysql-mysql-
master-0|grep Liveness:
    Liveness:       exec [sh -c exec mysqladmin status -uroot -p$MYSQL_ROOT_PASSWORD] delay=120s timeout=1s period=10s #success=1 #failure=3
$ kubectl describe pods/mysql-mysql-slave-0|grep Liveness:
    Liveness:       exec [sh -c exec mysqladmin status -uroot -p$MYSQL_MASTER_ROOT_PASSWORD] delay=120s timeout=1s period=10s #success=1 #failure=3
```

以下の例では、マスター、スレーブともに5秒間隔 x 5回のヘルスチェック失敗に設定を変更します。

``` yaml
# file: mysql/mysql/values
mysql:
  db:
    name: testdb
  root:
    password: easydoggie
  replication:
    enabled: true
  master:
    livenessProbe:
      periodSeconds: 5
      failureThreshold: 5
  slave:
    replicas: 1
    livenessProbe:
      periodSeconds: 5
      failureThreshold: 5
```

``` bash
$ kubectl describe pods/mysql-mysql-master-0|grep Liveness:
    Liveness:       exec [sh -c exec mysqladmin status -uroot -p$MYSQL_ROOT_PASSWORD] delay=120s timeout=1s period=5s #success=1 #failure=5
$ kubectl describe pods/mysql-mysql-slave-0|grep Liveness:
    Liveness:       exec [sh -c exec mysqladmin status -uroot -p$MYSQL_MASTER_ROOT_PASSWORD] delay=120s timeout=1s period=5s #success=1 #failure=5
```