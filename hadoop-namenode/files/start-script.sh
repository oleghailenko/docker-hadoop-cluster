#!/bin/bash
./usr/local/hadoop/bin/hdfs namenode -format
./usr/local/hadoop/sbin/start-dfs.sh
./usr/local/hadoop/sbin/start-yarn.sh
./usr/local/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver