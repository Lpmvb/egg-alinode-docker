FROM centos:7

USER root

RUN yum install wget -y 
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

ENV HOME=/root \
    ALINODE_VERSION=3.11.5 \
    TNVM_DIR=/root/.tnvm

RUN wget -O- https://raw.githubusercontent.com/aliyun-node/tnvm/master/install.sh | bash
RUN source $HOME/.bashrc \
    && tnvm install "alinode-v$ALINODE_VERSION" \
    && tnvm use "alinode-v$ALINODE_VERSION"

SHELL ["/bin/bash", "-c", "-l"]
