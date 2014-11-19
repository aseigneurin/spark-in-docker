#!/bin/bash -e

IP=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }')

echo "===> IP of the Nameserver: $IP"
echo
echo "   >   HDFS UI: http://$IP:50070"
echo "   >   HDFS URL: hdfs://namenode:9000"
echo

HOSTNAME=`hostname`
echo "host-record=$HOSTNAME,$IP" > /opt/docker/dnsmasq.d/0host_$HOSTNAME

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
export PATH=$PATH:/hadoop-2.5.1/bin

hdfs namenode -format
hdfs namenode
