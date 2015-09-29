###### Updated version of fedora (22)
FROM fedora:22
MAINTAINER "Christian Kniep <christian@qnib.org>"

# Solution for 'ping: icmp open socket: Operation not permitted'
RUN ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime

ADD etc/yum.conf /etc/yum.conf
RUN dnf install -y python-dnf-plugins-extras-migrate && dnf-2 migrate

RUN dnf update -y -x systemd -x systemd-libs -x iputils
RUN dnf install -y wget 
