Dockerfiles and scripts to run Apache Spark on Docker:

- a DNS server
- a Spark master
- 1+ Spark workers

Start the DNS server:

    $ cd nameserver
    $ docker build .
    ...
    Successfully built 29d54e4ca76d
    $ docker run --name nameserver --rm -ti -P -v /tmp/dnsmasq.d:/opt/docker/dnsmasq.d 29d54e4ca76d
    ===> IP of the Nameserver: 172.17.0.60
    ...

Start the Spark master (reusing the IP from the DNS server):

    $ cd master
    $ docker build .
    ...
    Successfully built c2d6e585107c
    $ docker run --name spark_master --rm -ti -p 8080:8080 --dns 172.17.0.60 --volumes-from=nameserver c2d6e585107c
    ===> IP of the Master: 172.17.0.47
    ...

Start one or more Spark workers (still reusing the IP from the DNS server):

    $ cd worker
    $ docker build .
    ...
    Successfully built 61f5df841bbc
    $ docker run --rm -ti --dns 172.17.0.60 --volumes-from=nameserver 61f5df841bbc