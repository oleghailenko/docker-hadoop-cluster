#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]]; do
  docker -H tcp://$line:2375 stop $line-datanode
  docker -H tcp://$line:2375 rm $line-datanode
done < "nodes"

docker -H master:2375 stop master-namenode
docker -H master:2375 rm master-namenode