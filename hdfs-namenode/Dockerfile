FROM ubuntu:14.10

RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install openjdk-8-jre

RUN curl http://wwwftp.ciril.fr/pub/apache/hadoop/common/hadoop-2.5.1/hadoop-2.5.1.tar.gz | tar xvz

EXPOSE 9000 50070

ADD files/core-site.xml /hadoop-2.5.1/etc/hadoop/core-site.xml
ADD files/hdfs-site.xml /hadoop-2.5.1/etc/hadoop/hdfs-site.xml

ADD scripts /root/scripts

CMD /root/scripts/run_hdfs_namenode.sh
