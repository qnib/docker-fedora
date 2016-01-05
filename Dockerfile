###### Updated version of fedora (22)
FROM fedora:20
MAINTAINER "Christian Kniep <christian@qnib.org>"

# Solution for 'ping: icmp open socket: Operation not permitted'
RUN ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime

ADD etc/yum.conf /etc/yum.conf
RUN echo "2016-01-05";yum clean all && \
    yum swap fakesystemd systemd && \
    yum update -y -x systemd -x systemd-libs -x iputils && \
    yum install -y wget vim 
