+++
title = "Install"
date = 2019-06-14T17:54:31+09:00
weight = 1
pre = "<b>1. </b>"
+++

Helm Chartごとの個別インストール方法を説明しています。  
Helmのローカルリポジトリ情報を最新にするために、インストールの実行前にリポジトリのアップデートを行ってください。
```text
$ helm repo update
```

設定の変更は、以下の2通りがあります。

1. `helm install`コマンドの`--set`オプションで変更する。
2. `helm inspect values`コマンドでvalues.yamlを取得して、`helm install`コマンドの`-f`オプションで変更したvalues.yamlを指定する。

一次的な変更の場合は、`--set`オプションを利用する方法が手軽に確認を行うことができます。 恒久的な変更の場合は、Git等でvalues.yamlを管理できる`-f`オプションを利用する方法をお勧めします。