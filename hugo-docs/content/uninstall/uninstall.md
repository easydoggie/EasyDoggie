+++
title = "Uninstall"
date =  2019-06-18T15:14:04+09:00
weight = 1
tags = ["Adminer", "drone", "Elasticsearch", "Fluentd", "Gitea", "Kibana", "MySQL", "Nginx", "Nginx Ingress", "Nginx Unit", "Node.js", "Redis"]
+++

## アンインストール
完全に消去する場合は、`--purge`オプションを利用します。<release_name>には削除対象のリリース名を指定します。
```bash
$ helm delete --purge <release_name>
```