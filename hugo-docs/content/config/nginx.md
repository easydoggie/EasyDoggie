+++
title = "NGINX, NGINX Unit"
date =  2019-06-20T17:16:07+09:00
weight = 80
tags = ["NGINX", "NGINX Unit"]
+++

## サービスの構成、初期化方法の変更
以下の表はNGINXおよびNGINX Unitの変更可能なパラーメータとデフォルト値の一覧です。
<div style="font-size:small">

|パラメータ|デフォルト|説明 |
|---|---|---|
|`replicaCount`|1|レプリカセットの数|
|`image.repository`| nginx |NGINXのイメージ名|
|`image.tag`| 1.16.0-alpine|NGINXイメージのタグ名|
|`image.pullPolicy`| IfNotPresent|イメージのプルポリシー|
|`imageUnit.repository`|nginx/unit|NGINX Unitのイメージ名|
|`imageUnit.tag`|1.9.0-full|NGINX Unitのタグ名|
|`imageUnit.pullPolicy`|IfNotPresent|イメージのプルポリシー|
|`imageInit.alpine.repository`|alpine/git|初期化コンテナ(git clone)用のイメージ名|
|`imageInit.alpine.tag`|latest|初期化イメージのタグ名|
|`imageInit.alpine.pullPolicy`|IfNotPresent|初期化イメージのプルポリシー|
|`imageInit.alpine.command`|\|-<br>      - &quot;&quot;|初期化コンテナのEntryPoint|
|`imageInit.alpine.args`|\|-<br>      - &quot;clone&quot;<br>      - &quot;https://github.com/easydoggie/testapp.git&quot;<br>      - &quot;/tmp/git&quot;|初期化コンテナのCMD|
|`imageInit.python.repository`| python|初期化コンテナ(python)用のイメージ名|
|`imageInit.python.tag`| 3.5-alpine|初期化イメージのタグ名|
|`imageInit.python.pullPolicy`| IfNotPresent|初期化イメージのプルポリシー|
|`imageInit.python.command`| \|-<br>      - &quot;/bin/sh&quot;<br>      - &quot;-c&quot;<br>      - &quot;apk add git; \\<br>         git clone https://github.com/easydoggie/testapp.git /tmp/git; \\<br>         python -m venv /tmp/git/python/venv; \\<br>         . /tmp/git/python/venv/bin/activate; \\<br>         pip install redis&quot;|初期化コンテナのEntryPoint|
|`imageInit.python.args`| \|-<br>      - &quot;&quot;|初期化イメージのCMD|
|`appServer.enabled`| true|NGINXとNGINX Unitを使う場合はtrue。NGINXだけを利用する場合はfalse。|
|`appServer.port`|8300|APサーバのポート|
|`appServer.applications.name`|testapp|アプリケーションの名前|
|`appServer.applications.type`|python 3.5|アプリケーションのタイプ。external(GoまたはNode.jsの場合), java, php, python, ruby|
|`appServer.applications.processes`|1|アプリケーションのプロセス数|
|`appServer.applications.workingDirectory`|/app/python|アプリケーションのワーキングディレクトリ|
|`appServer.applications.user`|www-data|アプリケーションの実行ユーザ|
|`appServer.applications.group`|www-data|アプリケーションの実行グループ|
|`appServer.applications.timeout`|10|リクエストタイムアウト時間(秒)|
|`appServer.applications.requests`|1000|プロセス当たりの最大リクエスト数|
|`appServer.applications.python.module`|index|WSGIモジュール名|
|`appServer.settings.headerReadTimeout`|30|ヘッダリクエストのタイムアウト時間(秒)|
|`appServer.settings.bodyReadTimeout`|30|ボディデータの読み込みタイムアウト時間(秒)|
|`appServer.settings.sendTimeout`|30|レスポンス送信のタイムアウト時間(秒)|
|`appServer.settings.idleTimeout`|180|keep-aliveコネクションのタイムアウト時間(秒)|
|`appServer.maxBodySize`|8388608|クライアントリクエストの最大ボディサイズ(byte)|
|`nameOverride`| &quot;&quot;|チャート名を上書きする場合に使用する|
|`fullnameOverride`|nginx|アプリケーション名を上書きする場合に使用する。指定しない場合は、チャート名-リリース名が設定される|
|`service.type`|NodePort|Serviceのタイプ|
|`service.port`|80|Serviceのポート|
|`service.targetPort`| 80|Serviceのターゲットポート|
|`resources`| {}|Podのリソース使用量の管理|
|`nodeSelector`| {}|nodeSelectorの設定|
|`tolerations`| []|tolerationsの設定|
|`affinity`| {}|affinityの設定|

</div>