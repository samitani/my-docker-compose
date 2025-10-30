FROM rockylinux:9

ENV container=docker
ENV TZ="Asia/Tokyo"

RUN dnf install -y epel-release https://repo.percona.com/yum/percona-release-latest.noarch.rpm \
    && percona-release setup pt

RUN dnf install -y screen vim git wget net-tools strace telnet percona-toolkit \
    && wget https://go.dev/dl/go1.22.5.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.22.5.linux-amd64.tar.gz

RUN yum update -y --disablerepo='mysql*'

RUN wget -O /root/.screenrc https://raw.githubusercontent.com/samitani/dotfiles/refs/heads/master/screenrc \
    && wget -O /root/.vimrc https://raw.githubusercontent.com/samitani/dotfiles/refs/heads/master/vimrc

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

CMD ["/usr/sbin/init"]
