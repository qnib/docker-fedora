###### Updated version of fedora (22)
FROM fedora
MAINTAINER "Christian Kniep <christian@qnib.org>"

# Solution for 'ping: icmp open socket: Operation not permitted'
RUN ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime

ADD etc/yum.conf /etc/yum.conf
RUN dnf install -y python-dnf-plugins-extras-migrate && dnf-2 migrate && \
    echo "2015-03-24"; dnf clean all && \
    dnf update -y -x systemd -x systemd-libs -x iputils && \
    dnf install -y wget vim curl hostname iproute
