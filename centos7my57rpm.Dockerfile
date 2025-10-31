FROM centos7base

RUN yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm \
    && yum-config-manager --disable mysql80-community \
    && yum-config-manager --enable mysql57-community \
    && yum install -y --nogpgcheck mysql-community-server mysql-community-libs-compat mysql-shell sysbench

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
