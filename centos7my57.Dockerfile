FROM centos:7
ENV container docker

RUN yum install -y https://vault.centos.org/7.9.2009/updates/x86_64/Packages/centos-release-7-9.2009.2.el7.centos.x86_64.rpm https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm \
 && yum-config-manager --disable base updates extras \
 && yum-config-manager --enable C7.9.2009-base C7.9.2009-updates C7.9.2009-extras \
 && yum-config-manager --disable mysql80-community \
 && yum-config-manager --enable mysql57-community \
 && yum install -y epel-release


RUN yum install -y screen vim git wget net-tools strace telnet \
 && yum install -y --nogpgcheck mysql-community-server mysql-community-libs-compat mysql-shell \
 && wget https://go.dev/dl/go1.22.5.linux-amd64.tar.gz

RUN yum update -y --disablerepo='mysql*'

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
