+++
title = "Elasticsearch"
date =  2019-06-19T16:50:57+09:00
weight = 20
tags = ["Elasticsearch"]
+++

## デフォルトの設定
```yaml
# file: elasticsearch/elasticsearch/values.yaml
elasticsearch:
  roles:
    ingest: false
  replicas: 1
  resources:
    requests:
      memory: 128Mi
```

|パラメータ|初期値|説明|
|---|---|---|
|`elasticsearch.roles.ingest`|false|ElasticsearchのIngest nodeを無効にします。有効にする場合はtrueに設定します。|
|`elasticsearch.replicas`|1|Elasticsearchのレプリカ数|
|`elasticsearch.resources.requests.memory`|128Mi|メモリ使用量の上限|