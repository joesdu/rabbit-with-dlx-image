# rabbit-with-rabbitmq-delayed-exchange

RabbitMQ Server with Delayed-Message0Exchange
RabbitMQ 服务端镜像,以官方 rabbitmq:management 为基底,添加 [rabbitmq-delayed-exchange](https://github.com/rabbitmq/rabbitmq-delayed-message-exchange) 插件

#### 支持平台

|   平台代号    | 常见设备                      |
| :-----------: | ----------------------------- |
|  linux/amd64  | AMD,Intel PC 和其他服务器产品 |
|  linux/arm64  | ARM64 位设备,树莓派等         |
| linux/arm/v7  | 旧版树莓派,其他国产派         |
| linux/ppc64le | 没见过                        |
|  linux/s390x  | 没见过                        |

### Version

- 3.13.x

### 使用

```bash
# 直接拉取最新版镜像
docker pull dygood/rabbitmq-dlx:latest
```

```bash
# 本机快速启动镜像测试
docker run --name rabbitmq -p 5672:5672 -p 15672:15672 -d --rm -it -e RABBITMQ_DEFAULT_USER=guest -e RABBITMQ_DEFAULT_PASS=guest dygood/rabbitmq-dlx:latest
```

#### Docker Compose 使用例子

```yml
#version: "3.8"

services:
  rabbitmq:
    image: dygood/rabbitmq-dlx:latest
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
