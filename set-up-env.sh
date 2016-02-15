#!/bin/bash

# 1. Generate ssh keys.
ssh-keygen -f hadoop-base/files/id_key -t rsa -N '' -P ""

# 2. Download, rename and move hadoop
wget http://apache.mirrors.tds.net/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz -P . && tar zxvf hadoop-*.tar.gz && mv hadoop-2.7.1 hadoop && tar -zcvf hadoop.tar.gz hadoop && mv hadoop.tar.gz hadoop-base/files/ && rm -rf hadoop && rm hadoop-2.7.1.tar.gz

# 3. Download Java 8
wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz -P hadoop-base/files/

# 4. Fill slave nodes names
cat nodes > hadoop-namenode/files/slaves
cat masters > hadoop-namenode/files/masters