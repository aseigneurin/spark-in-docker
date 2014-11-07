FROM ubuntu:14.10

RUN apt-get update
RUN apt-get install -y dnsmasq-base

RUN echo "user=root" > /etc/dnsmasq.conf
RUN echo "interface=lo" >> /etc/dnsmasq.conf
RUN echo "interface=eth0" >> /etc/dnsmasq.conf
RUN echo "resolv-file=/etc/resolv.dnsmasq.conf" >> /etc/dnsmasq.conf
#RUN echo "conf-dir=/etc/dnsmasq.d"  >> /etc/dnsmasq.conf
RUN echo "conf-dir=/opt/docker/dnsmasq.d"  >> /etc/dnsmasq.conf
RUN echo "domain=cluster.com"  >> /etc/dnsmasq.conf

RUN echo "nameserver 8.8.8.8" >> /etc/resolv.dnsmasq.conf

EXPOSE 53

VOLUME /opt/docker/dnsmasq.d

ADD files /root/scripts

CMD /root/scripts/run_dnsmasq.sh
