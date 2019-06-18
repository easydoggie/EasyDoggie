+++
title = "Prometheus"
date =  2019-06-18T15:11:47+09:00
weight = 5
tags = ["Prometheuses"]
+++

## Prometheus Operatorの完全アンインストール
`helm delete`コマンドだけだと、kunernetesのCRD(Custom Resource Definitions)は削除されません。
CRDは`kubectl delete crd`コマンドで個別に削除をします。
```sh
$ helm delete --purge <release_name>
$ kubectl delete crd prometheuses.monitoring.coreos.com
$ kubectl delete crd prometheusrules.monitoring.coreos.com
$ kubectl delete crd servicemonitors.monitoring.coreos.com
$ kubectl delete crd alertmanagers.monitoring.coreos.com
```