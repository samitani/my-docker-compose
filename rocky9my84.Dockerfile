FROM rockylinux:9
ENV container docker

RUN dnf install -y https://dev.mysql.com/get/mysql84-community-release-el9-1.noarch.rpm epel-release

RUN dnf install -y screen vim git wget net-tools strace telnet \
 && dnf install -y --nogpgcheck mysql-community-server mysql-shell \
 && wget https://go.dev/dl/go1.22.5.linux-amd64.tar.gz

RUN yum update -y --disablerepo='mysql*'

CMD ["/usr/sbin/init"]
