+++
title = "Adminer"
date =  2019-06-20T17:14:58+09:00
weight = 10
tags = ['Adminer']
+++

## サービスの構成、初期化方法の変更
以下の表はAdminerの変更可能なパラーメータとデフォルト値の一覧です。
<div style="font-size:small">

|パラメータ|デフォルト|説明 |
|---|---|---|
|`replicaCount`|1|レプリカセットの数|
|`image.repository`|easydoggie/adminer|Adminerのイメージ名|
|`image.tag`|0.1.0|Adminerイメージのタグ名|
|`image.pullPolicy`|IfNotPresent|イメージのプルポリシー|
|`imageNginx.repository`|nginx|Adminer用リバースプロキシのイメージ名|
|`imageNginx.tag`|1.15.12-alpine|Adminer用リバースプロキシイメージのタグ名|
|`imageNginx.pullPolicy`|IfNotPresent|Adminer用リバースプロキシイメージのプルポリシー|
|`nameOverride`|""|チャート名を上書きする場合に使用する|
|`fullnameOverride`|adminer|アプリケーション名を上書きする場合に使用する。指定しない場合は、チャート名-リリース名が設定される|
|`service.type`|NodePort|Serviceのタイプ|
|`service.port`|80|Serviceのポート|
|`service.targetPort`|80|Serviceのターゲットポート|
|`appServer.port`|8300|Adminerのポート|
|`resources`|{}|Podリソース使用量の管理|
|`nodeSelector`|{}|nodeSelectorの設定|
|`tolerations`|[]|tolerationsの設定|
|`affinity`|{}|affinityの設定|

</div>