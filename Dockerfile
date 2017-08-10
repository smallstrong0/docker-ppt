############################################################
# Dockerfile to build Python WSGI Application Containers
# Based on Ubuntu
############################################################

# Set the base image to centos  这一步就是站在巨人肩膀上装逼，先copy一个centos，放在最底下
FROM centos

# File Author / Maintainer   这一步说的是作者及联系方式
MAINTAINER smallstrong smallstrong007@gmail.com

# Install applications   这一步centos中采用yum来下载安装软件。 linux中redhat,contos,fedora 一般用yum作为包管理，debian以及Ubuntu一般用apt-get做包管理。
# 要注意其实这边每次安装一个软件，就等于对这个centos基础镜像做升级会变成一个新的镜像。下面所有操作也是同理
RUN yum -y install epel-release
RUN yum -y install python-pip # pip管道装起来，py大法就靠这个了。
# python-dev python-distribute

# Copy the application folder inside the container  你本地自己编写的文件放进这个容器中
ADD .be/ /beichoo-api/
ADD .fe/ /beichoo-api/
ADD .lib/ /beichoo-api/
ADD .email_template/ /beichoo-api/
ADD ./etc/beichoo.py /etc/fanfan/

# Get pip to download and install requirements: 用pip来装python需要的软件
RUN pip install -r web.py
RUN pip install -r ots2
RUN pip install -r redis
RUN pip install -r requests


# Expose ports  声明运行时容器提供服务端口
EXPOSE 6000


# Set the default directory where CMD will execute 指定工作目录，以后各层的当前目录就被改为这顶的目录。
WORKDIR /beichoo-api

# Set the default command to execute
# when creating a new container
# i.e. using CherryPy to serve the application
CMD python /beichoo-api/fe/index.py  启动容器，程序入口文件。一个web服务端就这样跑起来了

# 上面这个是beichoo B端中前人做的尝试 屌屌的。这么个文件就创建出一个后端服务
# 下面我来以Jenkins为例，看看别人家的孩子是怎么一步步搞出来的  docker history jenkins
# 这里只是展示了部分命令，详细的自查。