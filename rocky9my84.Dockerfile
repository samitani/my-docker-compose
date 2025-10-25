FROM rocky9base

RUN dnf install -y https://dev.mysql.com/get/mysql84-community-release-el9-1.noarch.rpm epel-release
RUN dnf install -y --nogpgcheck mysql-community-server mysql-shell sysbench
