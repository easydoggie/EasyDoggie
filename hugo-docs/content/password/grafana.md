+++
title = "Grafana"
date =  2019-06-17T10:16:06+09:00
weight = 5
tag = ["Grafana"]
+++

## Grafana
以下のコマンドでadminユーザの初期パスワードを取得します。
```bash
$ kubectl get secret grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```