#!/bin/bash -e

IP=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }')

echo "===> IP of the Nameserver: $IP"
echo

dnsmasq

while [ 1 ];
do
    sleep 3
    # kill and restart dnsmasq every three seconds
    # in case its configuration has changed
    pkill -x dnsmasq
    dnsmasq
done