#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
  docker -H tcp://$line:2375 run --name $line-datanode -t -d --net host oleghailenko/hadoop-datanode:v1
done < "nodes"

docker -H master:2375 run --name master-namenode -t -it --net host oleghailenko/hadoop-namenode:v1