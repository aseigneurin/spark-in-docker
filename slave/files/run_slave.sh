#!/bin/bash -e

IP=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }')

echo "===> IP of this Slave: $IP"
echo

HOSTNAME=`hostname`
echo "host-record=$HOSTNAME,$IP" > /opt/docker/dnsmasq.d/0host_$HOSTNAME

cd /spark-1.1.0-bin-hadoop2.4/
bin/spark-class org.apache.spark.deploy.worker.Worker spark://master:7077 --port 7077
