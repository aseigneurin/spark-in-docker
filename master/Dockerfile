FROM ubuntu:14.10

RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install openjdk-8-jre

RUN curl http://d3kbcqa49mib13.cloudfront.net/spark-1.1.0-bin-hadoop2.4.tgz | tar xvz

EXPOSE 8080 7077

ADD scripts /root/scripts

CMD /root/scripts/run_master.sh
