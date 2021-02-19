# docker_aosp_build
docker aosp build environment

基于ubuntu20.04创建的docker镜像

# 创建镜像

使用如下命令创建镜像

docker build -t ubuntu-20.04-aosp .

# 启动镜像

假设aosp源码下载路径为 /Users/work/android/aosp，使用aosp-build镜像创建容器，并挂载aosp源码路径

docker run -itd --name ubuntu-20.04-aosp -v /Users/work/android/aosp:/work/android/aosp ubuntu-20.04-aosp

docker exec -it ubuntu-20.04-aosp /bin/bash

进入 /work/android/aosp 目录，直接编译源码即可