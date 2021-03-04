#!/bin/bash

docker run -d \
    -p 9090:9090 \
    -v /home/afzc/Documentos/afzc/Gato_Geek_TI/docker/containers/prometheus+grafana/prometheus.yml:/etc/prometheus/prometheus.yml \
    prom/prometheus
