repos:
  lookup:
    repos:
      elasticsearch:
        url: http://packages.elasticsearch.org/elasticsearch/1.5/debian
        dist: stable
        comps:
          - main
        keyurl: http://packages.elasticsearch.org/GPG-KEY-elasticsearch
        
elasticsearch:
  lookup:
    defaults:
      JAVA_HOME: /opt/java/jdk/current/src
      ES_HEAP_SIZE: 512m
    settings:
      cluster:
        name: cluster1
      node:
        name: {{ salt['grains.get']('fqdn') }}
        master: true
        data: true
      index:
        number_of_replicas: 0
      gateway:
        expected_nodes: 1
      discovery:
        zen:
          ping:
            multicast:
              enabled: false
    plugins:
      - name: lmenezes/elasticsearch-kopf
        installed_name: kopf
        
sysctl:
  lookup:
    params:
      - name: vm.swappiness
        value: 1
      - name: vm.max_map_count
        value: 262144
