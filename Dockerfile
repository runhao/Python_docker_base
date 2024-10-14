# 建立 python3.12 环境
FROM dockerproxy.cn/library/python:3.12.2

MAINTAINER runhao

# 设置 python 环境变量
ENV PYTHONUNBUFFERED 1

# 设置pip源为国内源
COPY pip.conf /root/.pip/pip.conf

# 设置apt-get源
COPY debian.sources /etc/apt/sources.list.d/debian.sources

# 更新apt-get源
RUN apt-get clean \
&& apt-get upgrade -y\
&& apt-get update 

# 下载相关
RUN apt-get install -y vim \
&& apt-get install -y nginx=1.22.1-9

# 启动nginx服务
RUN nginx
