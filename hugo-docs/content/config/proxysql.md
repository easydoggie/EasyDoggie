+++
title = "Proxysql"
date =  2019-07-04T13:26:56+09:00
weight = 111
tags = ["ProxySQL"]
+++

## サービスの構成、初期化方法の変更
以下の表はProxySQLの変更可能なパラーメータとデフォルト値の一覧です。
<div style="font-size:small">

|パラメータ|デフォルト|説明 |
|---|---|---|
|`replicaCount`|1|レプリカセットの数|
|`image.repository`|severalnines/proxysql|ProxySQLのイメージ名|
|`image.tag`|2.0.4|ProxySQLイメージのタグ名|
|`image.pullPolicy`|IfNotPresent|イメージのプルポリシー|
|`nameOverride`|""|チャート名を上書きする場合に使用する|
|`fullnameOverride`|"proxysql"|アプリケーション名を上書きする場合に使用する。指定しない場合は、チャート名-リリース名が設定される|
|`service.type`|ClusterIP|Serviceのタイプ|
|`service.adminPort.port`|6032|ProxySQLの管理用ポート|
|`service.adminPort.name`|admin|ProxySQLの管理ポート名|
|`service.servicePort.port`|6033|ProxySQLのサービス提供ポート|
|`service.servicePort.name`|service|ProxySQLのサービス提供ポート名|
|`proxysql.servers`|- server: mysql-mysql<br>  hostgroup: 10<br>  port: 3306<br>  maxConnections: 100<br>- server: mysql-mysql-slave<br>  hostgroup: 20<br>  port: 3306<br>   maxConnections: 100|ProxySQLの接続先サーバー情報の配列。<br>server:サーバ名、アドレス<br>hostgroup:ホストグループ<br>port: MySQLポート<br>maxConnections: Maxコネクション数|
|`proxysql.users`|- user: testuser<br>  password: easydoggie<br>  hostgroup: 10|ProxySQLの接続ユーザの配列<br>user: ユーザ名<br>password: パスワード<br>hostgroup: デフォルトのホストグループ|
|`proxysql.monitor.user`|testuser|ProxySQLのモニター用ユーザ|
|`proxysql.monitor.password`|easydoggie|モニター用ユーザのパスワード|
|`proxysql.admin.user`|admin|ProxySQLの管理用ユーザ|
|`proxysql.admin.password`|admin|管理用ユーザのパスワード|
|`resources`|{}|Podリソース使用量の管理|
|`nodeSelector`|{}|nodeSelectorの設定|
|`tolerations`|[]|tolerationsの設定|
|`affinity`|{}|affinityの設定|
</div>