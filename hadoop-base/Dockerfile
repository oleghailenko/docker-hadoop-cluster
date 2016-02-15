FROM sequenceiq/pam:ubuntu-14.04

MAINTAINER Oleg Hailenko <oleg.hailenko@pragmasoft.com.ua>

ENV JAVA_HOME /usr/local/jdk1.8.0_45
ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop

RUN apt-get update && apt-get install -y --no-install-recommends openssh-server

RUN sed -i 's/Port 22/Port 2222/' /etc/ssh/sshd_config && \
    sed -i 's/#   Port 22/Port 2222/' /etc/ssh/ssh_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ADD files/id_key.pub /root/.ssh/authorized_keys
ADD files/id_key /root/.ssh/id_rsa
ADD files/ssh_config /root/.ssh/config

RUN chmod 664 /root/.ssh/authorized_keys && \
    chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/config

ADD files/jdk-8u45-linux-x64.tar.gz /usr/local/
ADD files/hadoop.tar.gz /usr/local
ADD files/core-site.xml $HADOOP_CONF_DIR/core-site.xml
ADD files/yarn-site.xml $HADOOP_CONF_DIR/yarn-site.xml
ADD files/mapred-site.xml $HADOOP_CONF_DIR/mapred-site.xml
ADD files/hadoop-env.sh $HADOOP_CONF_DIR/hadoop-env.sh
ADD files/hdfs-site.xml $HADOOP_CONF_DIR/hdfs-site.xml

RUN echo 'export JAVA_HOME=/usr/local/jdk1.8.0_45 \n \ 
export HADOOP_HOME=/usr/local/hadoop \n \ 
export PATH=$PATH:$JAVA_HOME/bin \n \
export PATH=$PATH:$HADOOP_HOME/bin \n \ 
export PATH=$PATH:$HADOOP_HOME/sbin \n \ 
export HADOOP_MAPRED_HOME=$HADOOP_HOME \n \ 
export HADOOP_COMMON_HOME=$HADOOP_HOME \n \ 
export HADOOP_HDFS_HOME=$HADOOP_HOME \n \ 
export YARN_HOME=$HADOOP_HOME \n \ 
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native \n \ 
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib"  \n' >> /root/.bashrc && \
    mkdir -p /usr/local/hadoop/hadoop_data/hdfs/datanode && \
    mkdir -p /usr/local/hadoop/hadoop_data/hdfs/namenode

CMD service ssh start && /bin/bash