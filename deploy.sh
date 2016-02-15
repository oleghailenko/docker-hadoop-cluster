#!/bin/bash
docker build -t oleghailenko/hadoop-base:v1 hadoop-base/
docker build -t oleghailenko/hadoop-datanode:v1 hadoop-datanode/
docker build -t oleghailenko/hadoop-namenode:v1 hadoop-namenode/

docker push oleghailenko/hadoop-base:v1
docker push oleghailenko/hadoop-datanode:v1
docker push oleghailenko/hadoop-namenode:v1