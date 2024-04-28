# 使用 rabbitmq:latest 作为基础镜像
FROM rabbitmq:latest

# 添加插件到指定目录（可按照此方式自行扩展其他插件）
ADD ./rabbitmq_delayed_message_exchange-3.13.0.ez /plugins

# 开启管理界面插件
RUN rabbitmq-plugins enable rabbitmq_management
# 开启延迟队列插件
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange

# 设置入口点为 rabbitmq-server
ENTRYPOINT ["rabbitmq-server"]