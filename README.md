# Docker

### what is docker?
> docker这货就是个可以装很多容器的新型虚拟机。一个容器就是一个进程，这货做到了容器间的文件系统网络等的隔离。容器里能装镜像，这个镜像呢，至少里面是个最精简的Linux系统。你可以在别人的镜像上搞点小动作然后搞出来之后这个新的镜像就是你的了。

### Why we choose docker ?
1. 利用系统资源能力极高。同配置下传统虚拟机你开10个试试，但这货可以还远不止且打开速度极快。
2. docker最后生成的就是一个Image,这个image里面包含了环境，你可以理解成连着生产环境一块儿交付。任何平台，只需配置一次，随处跑。真正做到write once,run everywhere，不像某N。

### How docker works?
1. 你的先下载docker，并安装。
2. 为了更好管理你的镜像，你需要DockerToolbox，可以直接从镜像仓库下载官方镜像（dockerhub）
3. 考虑到天朝的网络，你或许需要一个代理。
[https://www.daocloud.io/mirror#accelerator-doc](https://www.daocloud.io/mirror#accelerator-doc)
4. 下载好你要的镜像之后，start一下，看看人家是怎么玩的。Nginx+tornado可以玩转py后端，Jenkins轻松持续集成,jekyll随随便便搞个blog玩玩
5. 不过这终究是别人家的镜像，我自己怎么做镜像呢？恩，接下来我们来站在巨人的肩膀上学习（~~装逼~~）

### Dockerfile
> Dockerfile这货是啥？这货是个脚本，用来构建docker镜像。
> 桌面temp路径下demo演示以及具体参数讲解
> 导出来看看你到底搞的是个啥玩意 docker export tomcat

### Learn docker（todo）
1. 数据管理
2. 容器互联
3. 网路配置
等等

> 这货很吊,实乃居家旅行之装逼利器。



# 一些命令
1. docker info:列出docker基本信息,所有容器和镜像的情况
2. docker run --name jenkins -i -t jenkins /bin/bash 创建一个容器叫Jenkins进入Jenkins容器并打开容器内的shell
3. exit可以切换回自己的电脑用户
4. docker ps -a 查看当前系统中容器的列表
5. docker  inspect 31f4b6b20718（容器名字）查看容器具体信息
6. docker rm 31f4b6b20718(容器名字) 干翻这个容器
7. docker images 列出镜像
8. docker build --no-cache 根据Dockerfile来构建镜像（可指定无缓存，因为docker每执行成功一条指令会缓存一个新容器）
9. docker history tomcat 可以查看tomcat这镜像build历史构建过程 这货到底经历了什么
10. cat tomcat.tar | sudo docker import - yourname/tomcat 导入容器
11. docker stop dockername  停止这个容器
