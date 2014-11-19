Dockerfiles and scripts to run [Spark](http://spark.apache.org) and [HDFS](http://hadoop.apache.org/docs/current/index.html) on Docker:

- a DNS server
- a Spark master
- a HDFS namenode
- 1+ nodes combining a Spark worker and a HDFS datanode

Start the DNS server:

    $ cd nameserver
    $ docker build .
    ...
    Successfully built 29d54e4ca76d
    $ docker run --name nameserver --rm -ti -P -v /tmp/dnsmasq.d:/opt/docker/dnsmasq.d 29d54e4ca76d
    ===> IP of the Nameserver: 172.17.0.60
    ...

Start the HDFS Namenode:

    $ cd hdfs-namenode
    $ docker build .
    ...
    Successfully built 62046786dde2
    $ docker run --name namenode --hostname namenode --rm -ti -p 50070:50070 --dns 172.17.0.60 --volumes-from=nameserver 62046786dde2
    ===> IP of the Nameserver: 172.17.0.60
    ...

Start the Spark master (reusing the IP from the DNS server):

    $ cd master
    $ docker build .
    ...
    Successfully built c2d6e585107c
    $ docker run --name master --hostname master --rm -ti -p 8080:8080 --dns 172.17.0.60 --volumes-from=nameserver c2d6e585107c
    ===> IP of the Master: 172.17.0.47
    ...

Start one or more Spark worker / HDFS datanode (still reusing the IP from the DNS server):

    $ cd worker
    $ docker build .
    ...
    Successfully built 61f5df841bbc
    $ docker run --rm -ti --dns 172.17.0.60 --volumes-from=nameserver 61f5df841bbc
