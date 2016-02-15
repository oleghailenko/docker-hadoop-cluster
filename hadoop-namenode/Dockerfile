FROM oleghailenko/hadoop-base:v1

MAINTAINER Oleg Hailenko <oleg.hailenko@pragmasoft.com.ua>

ADD files/masters $HADOOP_CONF_DIR/masters
ADD files/slaves $HADOOP_CONF_DIR/slaves
ADD files/start-script.sh /start-script.sh
RUN chmod +x /start-script.sh

CMD service ssh start && ./start-script.sh && bash