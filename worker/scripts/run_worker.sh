#!/bin/bash -e

IP=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }')

echo "===> IP of this Worker: $IP"
echo
echo "   >   Spark Worker: http://$IP:8081"
echo "   >   HDFS Datanode: http://$IP:50470"
echo

HOSTNAME=`hostname`
echo "host-record=$HOSTNAME,$IP" > /opt/docker/dnsmasq.d/0host_$HOSTNAME

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
export PATH=$PATH:/hadoop-2.5.1/bin

hdfs datanode &

cd /spark-1.1.0-bin-hadoop2.4/
bin/spark-class org.apache.spark.deploy.worker.Worker spark://master:7077 --port 7077
