+++
title = "Mysql"
date =  2019-06-18T15:19:46+09:00
weight = 70
tags = ["MySQL"]
+++

MySQLはデータベース管理システムです。  
シングルマスタもしくはマスタ-スレープ構成のMySQLをインストールすることができます。

## MySQLのインストール
![mysql](../../img/mysql.png)
\<release_name\>には任意のリリース名を指定します。
```sh
$ helm install --name <release_name> easydoggie/mysql
```
デフォルトではマスター x 1、スレーブ x 1のノードが起動します。
![mysql-containers](../../img/mysql-containers.png)
スレーブのノード数の変更などは、[設定変更のページ](../config/mysql)を参照してください。