FROM ubuntu:20.04

# 更新源
# COPY sources.list /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update

# 解决 debconf: unable to initialzie frontend: Dialog
ENV DEBIAN_FRONTEND noninteractive

# 配置java环境（这里使用openjdk-8）
# 注：Android5.x - Android 6.0编译需要用jdk7，Android7.0及其以上需要用jdk8

# 安装add-apt-repository
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$JAVA_HOME/bin:$PATH

# 配置系统语言环境和时区
#RUN apt-get install -y language-pack-zh-hants-base language-pack-zh-hans
ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN:zh

# 安装源码所需编译工具
RUN apt-get install -y git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib
RUN apt-get install -y libncurses5 libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev python
RUN apt-get install -y libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig