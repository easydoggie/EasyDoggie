+++
title = "Redis"
date =  2019-06-17T10:18:17+09:00
weight = 5
tags = ["Redis"]
+++

## シングルマスター構成
マスター x 1、スレーブ x 0の構成例です。スレーブを利用しない場合は、`cluster.enabled`の値を`false`に設定します。
```yaml
# file: redis/redis/values.yaml
redis:
  usePassword: false
  cluster:
    enabled: false
```

| #  |values |
|:----|:----:|
| Master | 1 |
| Slave | 0 |
| Master RDB | x |
| Master AOF | o |
<br>

|接続先|ホスト|ポート|
|:----|:----|----|
|Master|redis-master|6379|

## マスター、スレーブ構成
マスター x 1、スレーブ x 2の構成例です。スレーブを利用する場合は、`cluster.enabled`を`true`に設定します。スレーブのノード数は、`cluser.slaveCount`で設定します。

```yaml
# file: redis/redis/values.yaml
redis:
  usePassword: false
  cluster:
    enabled: true
    slaveCount: 2
```

| #  |values |
|:----|:----:|
| Master | 1 |
| Slave | 2 |
| Master RDB | x |
| Master AOF | o |
| Slave RDB | x |
| Slave AOF | o |
<br>

|接続先|ホスト|ポート|
|:----|:----|----|
|Master|redis-master|6379|
|Slave|redis-slave|6379|

## マスター、スレーブの切り離し間隔を調整する
マスター、スレーブのPodをServiceから切り離す時間を調整します。デフォルトでは以下のヘルスチェック間隔と連続失敗回数を満たすと、Serviceから切り離されます。

|node|ヘルスチェック間隔(秒)|失敗回数|
|----|----:|----:|
|Master|5|5|
|Slave|10|5|

```bash
$ kubectl describe pods/redis-master-0|grep Readiness:
    Readiness:      exec [sh -c /health/ping_local.sh 5] delay=5s timeout=1s period=5s #success=1 #failure=5
$ kubectl describe pods/redis-slave-0|grep Readiness:
    Readiness:      exec [sh -c /health/ping_local_and_master.sh 5] delay=5s timeout=10s period=10s #success=1 #failure=5
```

以下の例では、マスター、スレーブともに3秒間隔 x 3回のヘルスチェック失敗に設定を変更します。

```yaml
# file: redis/redis/values.yaml
redis:
  usePassword: false
  cluster:
    enabled: true
    slaveCount: 2
  master:
    readinessProbe:
      periodSeconds: 3
      failureThreshold: 3
  slave:
    readinessProbe:
      periodSeconds: 3
      failureThreshold: 3
```

```bash
$ kubectl describe pods/redis-master-0|grep Readiness:
    Readiness:      exec [sh -c /health/ping_local.sh 5] delay=5s timeout=1s period=3s #success=1 #failure=3
$ kubectl describe pods/redis-slave-0|grep Readiness:
    Readiness:      exec [sh -c /health/ping_local_and_master.sh 5] delay=5s timeout=10s period=3s #success=1 #failure=3
```

## マスター、スレーブの再起動間隔を調整する
マスター、スレーブのPodを再起動する間隔を調整します。デフォルトでは以下のヘルスチェック間隔と連続失敗回数を満たすと、Podの再起動が行われます。

|node|ヘルスチェック間隔(秒)|失敗回数|
|----|----:|----:|
|Master|5|5|
|Slave|10|5|

```bash
$ kubectl describe pods/redis-master-0|grep Liveness:
    Liveness:       exec [sh -c /health/ping_local.sh 5] delay=5s timeout=5s period=5s #success=1 #failure=5
$ kubectl describe pods/redis-slave-0|grep Liveness:
    Liveness:       exec [sh -c /health/ping_local_and_master.sh 5] delay=30s timeout=5s period=10s #success=1 #failure=5
```

以下の例では、マスター、スレーブともに3秒間隔 x 3回のヘルスチェック失敗に設定を変更します。

```yaml
# file: redis/redis/values.yaml
redis:
  usePassword: false
  cluster:
    enabled: true
    slaveCount: 2
  master:
    livenessProbe:
      periodSeconds: 3
      failureThreshold: 3
  slave:
    livenessProbe:
      periodSeconds: 3
      failureThreshold: 3
```

```bash
$ kubectl describe pods/redis-master-0|grep Liveness:
    Liveness:       exec [sh -c /health/ping_local.sh 5] delay=5s timeout=5s period=3s #success=1 #failure=3
$ kubectl describe pods/redis-slave-0|grep Liveness:
    Liveness:       exec [sh -c /health/ping_local_and_master.sh 5] delay=30s timeout=5s period=3s #success=1 #failure=3
```