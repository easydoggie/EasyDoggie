+++
title = "Drone"
date =  2019-06-19T13:46:05+09:00
weight = 5
+++
## デフォルトの設定

```yaml
#file: drone/values.yaml
drone:
  service:
    type: NodePort
  server:
    host: drone.localhost
  sourceControl:
    provider: gitea
    gitea:
      server: http://gitea:3000
  sharedSecret: 45f7a425dc0595bdca3af34ef97ebaa4
```

パラメータ|初期値|説明
---|---|---
drone.service.type|NodePort|Serviceタイプ
drone.server.host|drone.localhost|DroneのWebUIのホスト名
drone.sourceControl.provider|gitea|ソース管理をしているプロバイダ
drone.sourceControl.gitea.server|http://gitea:3000|Giteaサーバのアドレス
drone.sharedSecret|45f7a425dc0595bdca3af34ef97ebaa4|DroneとGiteaの共有秘密鍵

## 設定変更の例
### ServiceタイプをLoadBalancerに変更する
外部からのアクセスにIngressではなくLoadBalancerを使う場合は、Serviceタイプの変更を行います。  
以下のファイルをHelmクライアントを実行するサーバに作成します。
```yaml
# file: edit01-values.yaml
drone:
  service:
    type: LoadBalancer
```
インストールを実行します。
```plain
$ helm install --name drone -f edit01-values.yaml easydoggie/drone
```