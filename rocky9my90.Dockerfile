FROM rockylinux:9
ENV container docker

RUN dnf install -y https://dev.mysql.com/get/mysql84-community-release-el9-1.noarch.rpm epel-release
RUN dnf config-manager --disable mysql-8.4-lts-community mysql-tools-8.4-lts-community mysql-connectors-community && \
    dnf config-manager --enable mysql-tools-innovation-community mysql-innovation-community

RUN dnf install -y screen vim git wget net-tools strace telnet \
 && dnf install -y --nogpgcheck mysql-community-server mysql-shell sysbench \
 && wget https://go.dev/dl/go1.22.5.linux-amd64.tar.gz

RUN yum update -y --disablerepo='mysql*'

RUN wget -O /root/.screenrc https://raw.githubusercontent.com/samitani/dotfiles/refs/heads/master/screenrc \
    && wget -O /root/.vimrc https://raw.githubusercontent.com/samitani/dotfiles/refs/heads/master/vimrc

CMD ["/usr/sbin/init"]
