# EasyDoggie
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
Helmを利用してEasyDoggieをKubernetesにデプロイします。
```
$ helm install --name easydoggie easydoggie/easydoggie
```

# 使い方
2019年5月15日時点では、以下の構成サービスが起動します。
![structure_20190524](https://github.com/easydoggie/EasyDoggie/blob/master/images/structure_20190524.png)

## Web(nginx)へのアクセス
http://localhost/easydoggie

## giteaへのアクセス
http://localhost/gitea

# ライセンス
MIT
