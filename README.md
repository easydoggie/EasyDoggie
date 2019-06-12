# EasyDoggie
![logo2](https://github.com/easydoggie/EasyDoggie/blob/master/images/logo2.png)  
**ゲームインフラは、もっと楽にできる！**

スマートフォン向けゲームはレッドオーシャン化が進み、小規模の開発会社では生き残るのが難しくなっています。斬新なゲームアイデアを実現するためにゲームインフラとしてどのような貢献ができるのでしょうか？現実問題として、以下のような悩みを抱えている開発会社が多いのではないでしょうか。

> ・　サーバーサイドのプログラマですが、インフラも兼務しています。インフラの構築、運用に時間がかかってサーバサイドのプログラミングが進みません
>
> ・　インフラの初心者しか会社にいません。ミドルウェアのパラメータ設計の方法がわかりません。全部デフォルト値でよいですか？
> 
> ・　コンテナやマイクロサービスに興味があります。でもデプロイや監視の方法がわからないです。
> 
> ・　インフラの設計、構築、運用に実績のある外部ベンダに依頼したいのですが、外注コストが心配です。

このようなインフラ設計、構築、運用の悩みを解決するのに、構築済みのコンテナを再利用する方法があります。

**そう、EasyDoggieなら設計済みコンテナからCI/CD、運用監視まで、そろっています！**

## EasyDoggie構成イメージ
![structure](https://github.com/easydoggie/EasyDoggie/blob/master/images/structure.PNG)

# セットアップ方法
## Helmのインストール
EasyDoggieはKubernetes上で動作します。コンテナの初期設定はHelmを利用してインストールを行います。
初めにHelmのインストールと初期設定を行います。
Helmについては、[ブログ](https://www.skyarch.net/blog/?p=16335)でも紹介をしています。Helmの概要を知りたい場合に、参考にしてください。

```
$ wget https://storage.googleapis.com/kubernetes-helm/helm-v2.13.1-linux-amd64.tar.gz
$ tar xvfz helm-v2.13.1-linux-amd64.tar.gz
$ sudo mv linux-amd64/helm /usr/local/bin/helm
$ helm init
```
Helmのインストールについては、[ブログ](https://www.skyarch.net/blog/?p=16350)でも紹介をしているので、参考にしてください。
GKEなどRBACのアクセス制御が有効になっている環境では、Tillerをインストール前にサービスアカウントの設定を行ってください。
```
$ kubectl apply -f serviceaccount/helm-account.yaml
```

## Helmリポジトリの追加
EasyDoggie用のHelmリポジトリを追加します。
```
$ helm repo add easydoggie https://easydoggie.github.io/helm-repo/releases
$ helm repo list
NAME                    URL
stable                  https://kubernetes-charts.storage.googleapis.com
local                   http://127.0.0.1:8879/charts
easydoggie              https://easydoggie.github.io/helm-repo/releases
```

## EasyDoggieのインストール
Helmを利用してEasyDoggieをKubernetesにデプロイします。"easydoggie"チャートは、すべての構成をインストールします。
```
$ helm install --name easydoggie easydoggie/easydoggie
$ kubectl get pods
NAME                                                        READY   STATUS    RESTARTS   AGE
easydoggie-nginx-ingress-controller-749677776f-kb2fl        1/1     Running   0          30s
easydoggie-nginx-ingress-default-backend-8686dd6ff7-qmgdv   1/1     Running   0          30s
gitea-6dc55f758d-cwkt9                                      1/1     Running   0          31s
nginx-64f88989bc-n97ml                                      1/1     Running   0          30s
nginx-unit-5ff6499cb5-9ldnt                                 1/1     Running   0          30s
node-cb997ff45-psj4n                                        1/1     Running   0          30s
```
必要なパッケージのみインストールしたい場合は、インストール対象のチャートを指定してインストールをしてください。以下は、Nginxだけをインストールする例です。
```
$ helm install --name nginx easydoggie/nginx
```
# 使い方
2019年6月7日時点では、以下の構成サービスが起動します。
![structure_2](https://github.com/easydoggie/EasyDoggie/blob/master/images/structure2.png)

## Web(nginx)へのアクセス
http://localhost/easydoggie

## API(nginx unit)へのアクセス
http://localhost/easydoggie/api

## giteaへのアクセス
http://localhost/gitea

## Adminerへのアクセス
http://localhost/adminer

## Kibanaへのアクセス
http://localhost/kibana

## Grafanaへのアクセス
http://localhost/grafana

# 設定方法
構成ミドルウェアのパラメータ等の変更は、[Wiki](https://github.com/easydoggie/EasyDoggie/wiki)を参照してください。

# ライセンス
MIT

# 協賛
[![skyarch](https://github.com/easydoggie/EasyDoggie/blob/master/images/skyarch.gif)](https://www.skyarch.net/)