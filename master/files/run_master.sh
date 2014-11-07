#!/bin/bash -e

IP=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }')

echo "===> IP of the Master: $IP"
echo

echo "host-record=master,$IP" > /opt/docker/dnsmasq.d/0host_master

cd /spark-1.1.0-bin-hadoop2.4/
sbin/start-master.sh
tail -f logs/spark--org.apache.spark.deploy.master.Master-1*.out
