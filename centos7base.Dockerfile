FROM centos:7

ENV container=docker
ENV TZ="Asia/Tokyo"

RUN yum install -y https://vault.centos.org/7.9.2009/updates/x86_64/Packages/centos-release-7-9.2009.2.el7.centos.x86_64.rpm \
    && yum-config-manager --disable base updates extras \
    && yum-config-manager --enable C7.9.2009-base C7.9.2009-updates C7.9.2009-extras \
    && yum install -y epel-release \
    && yum install -y screen vim git wget net-tools strace telnet \
    && yum update -y \
    && wget https://go.dev/dl/go1.22.5.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.22.5.linux-amd64.tar.gz

RUN wget -O /root/.screenrc https://raw.githubusercontent.com/samitani/dotfiles/refs/heads/master/screenrc \
    && wget -O /root/.vimrc https://raw.githubusercontent.com/samitani/dotfiles/refs/heads/master/vimrc

CMD ["/usr/sbin/init"]
