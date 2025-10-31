FROM rocky9base

RUN cd /root && wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.44.tar.gz && tar xvfz mysql-8.0.44.tar.gz
RUN dnf config-manager --set-enabled crb \
    && dnf install -y cmake gcc-toolset-12-gcc gcc-toolset-12-gcc-c++ gcc-toolset-12-binutils gcc-toolset-12-annobin-annocheck gcc-toolset-12-annobin-plugin-gcc openssl-devel ncurses-devel libtirpc-devel rpcgen cpp

RUN mkdir bld && cd bld && cmake -DDOWNLOAD_BOOST=1 -DWITH_BOOST=/root/mysql-8.0.44/boost /root/mysql-8.0.44
RUN cd bld && make
