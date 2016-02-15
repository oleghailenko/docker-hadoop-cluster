#!/bin/bash
docker -H master:2375 build -t oleghailenko/hadoop-base:v1 hadoop-base/
docker -H master:2375 build -t oleghailenko/hadoop-namenode:v1 hadoop-namenode/
docker -H master:2375 build -t oleghailenko/hadoop-datanode:v1 hadoop-datanode/

while IFS='' read -r line || [[ -n "$line" ]]; do
  docker -H $line:2375 build -t oleghailenko/hadoop-base:v1 hadoop-base/
  docker -H $line:2375 build -t oleghailenko/hadoop-namenode:v1 hadoop-namenode/
  docker -H $line:2375 build -t oleghailenko/hadoop-datanode:v1 hadoop-datanode/
done < "nodes"