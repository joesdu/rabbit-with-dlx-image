# rabbit-with-rabbitmq-delayed-exchange

RabbitMQ Server with Delayed-Message0Exchange
RabbitMQ 服务端镜像,以官方 rabbitmq:management 为基底,添加 [rabbitmq-delayed-exchange](https://github.com/rabbitmq/rabbitmq-delayed-message-exchange) 插件

#### 支持平台

|   平台代号    | 常见设备                      |
| :-----------: | ----------------------------- |
|  linux/amd64  | AMD,Intel PC 和其他服务器产品 |
|  linux/arm64  | ARM64 位设备,树莓派等         |

### Version

- 4.x

### 使用 GitHub Packages

- 从 GitHub Packages 拉取镜像

```bash
docker pull ghcr.io/joesdu/rabbitmq-dlx:latest
```

### 使用 Docker Hub 仓库

- 直接拉取最新版镜像

```bash
docker pull dygood/rabbitmq-dlx:latest
```

- 本机快速启动镜像测试

```bash
docker run --name rabbitmq -p 5672:5672 -p 15672:15672 -d --rm -it -e RABBITMQ_DEFAULT_USER=guest -e RABBITMQ_DEFAULT_PASS=guest ghcr.io/joesdu/rabbitmq-dlx:latest
```

#### Docker Compose 使用例子

```yml
#version: "3.8"

services:
  rabbitmq:
    image: ghcr.io/joesdu/rabbitmq-dlx:latest
    hostname: rabbitserver
    environment:
      - TZ=Asia/Chongqing
      - RABBITMQ_DEFAULT_USER=admin
      - RABBITMQ_DEFAULT_PASS=a123456
    ports:
      - 5672:5672
      - 15672:15672
    deploy:
      resources:
        limits:
          memory: 1G
```
