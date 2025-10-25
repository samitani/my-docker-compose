FROM rocky9base

RUN dnf install -y https://dev.mysql.com/get/mysql84-community-release-el9-1.noarch.rpm epel-release
RUN dnf config-manager --disable mysql-8.4-lts-community mysql-tools-8.4-lts-community mysql-connectors-community && \
    dnf config-manager --enable mysql-tools-innovation-community mysql-innovation-community

RUN dnf install -y --nogpgcheck mysql-community-server mysql-shell sysbench
