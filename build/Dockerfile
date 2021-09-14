FROM n454149301/centos-openssh-openjdk:1.8.0_40
MAINTAINER naonao800@163.com

USER root
WORKDIR /root
#      ssh   | zookeeper client | zookeeper follower | zookeeper election | namenode rpc server | namenode http server | journalnode rpc server | journalnode http server | datanode server | webhdfs server
EXPOSE 10022   2181               2888                 3888                 9820                  9870                   8485                     8480                      9866              9900

# zookeeper
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz; tar xvf apache-zookeeper-3.6.2-bin.tar.gz; mv /root/apache-zookeeper-3.6.2-bin /root/zookeeper; rm apache-zookeeper-3.6.2-bin.tar.gz

# hadoop
RUN wget https://downloads.apache.org/hadoop/core/hadoop-3.2.1/hadoop-3.2.1.tar.gz; tar xvf hadoop-3.2.1.tar.gz; mv /root/hadoop-3.2.1 /root/hadoop; rm hadoop-3.2.1.tar.gz; cp /root/hadoop/etc/hadoop/hadoop-env.sh /root/hadoop/etc/hadoop/hadoop-env.demo.sh; /root/hadoop/etc/hadoop/httpfs-env.sh /root/hadoop/etc/hadoop/httpfs-env.demo.sh

# install libzstd
RUN yum update -y; yum install -y libzstd libzstd-devel openssl-devel

# copy start script
COPY ./* /root

ENV JAVA_HOME=/root/openjdk
