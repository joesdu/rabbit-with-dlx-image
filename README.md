# rabbit-with-rabbitmq-delayed-exchange

RabbitMQ Server with Delayed-Message0Exchange
RabbitMQ 服务端镜像,以官方 rabbitmq:latest 为基底,添加 [rabbitmq-delayed-exchange](https://github.com/rabbitmq/rabbitmq-delayed-message-exchange) 插件

### Version

- 3.13.x

### 使用

```bash
# 直接拉取最新版镜像
docker pull dygood/rabbitmq-dlx:latest
```

```bash
# 启动镜像
docker run --name rabbitmq -p 5672:5672 -p 15672:15672 -d --rm -it -e RABBITMQ_DEFAULT_USER=guest -e RABBITMQ_DEFAULT_PASS=guest dygood/rabbitmq-dlx:latest
```
