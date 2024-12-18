# 使用 rabbitmq:management 作为基础镜像,若是不需要管理页面可以使用rabbitmq:latest
FROM rabbitmq:latest

# 启用默认的 RabbitMQ 管理插件,若是不需要管理页面可以注释这行命令
RUN rabbitmq-plugins enable rabbitmq_management

# 添加插件到指定目录(可按照此方式自行扩展其他插件)
ADD ./rabbitmq_delayed_message_exchange-*.ez /plugins

RUN set -eux; \
	rabbitmq-plugins enable --offline rabbitmq_management; \
# make sure the metrics collector is re-enabled (disabled in the base image for Prometheus-style metrics by default)
	rm -f /etc/rabbitmq/conf.d/20-management_agent.disable_metrics_collector.conf; \
# grab "rabbitmqadmin" from inside the "rabbitmq_management-X.Y.Z" plugin folder
# see https://github.com/docker-library/rabbitmq/issues/207
	cp /plugins/rabbitmq_management-*/priv/www/cli/rabbitmqadmin /usr/local/bin/rabbitmqadmin; \
	[ -s /usr/local/bin/rabbitmqadmin ]; \
	chmod +x /usr/local/bin/rabbitmqadmin; \
	apt-get update; \
	apt-get install -y --no-install-recommends python3; \
	rm -rf /var/lib/apt/lists/*; \
	rabbitmqadmin --version
# 开启延迟队列插件
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange

# Opt-in to enable Khepri.
RUN rabbitmqctl enable_feature_flag --experimental khepri_db

# 创建新的虚拟主机和管理员用户(可选)
# 如果您希望创建新的虚拟主机和管理员用户,您可以在这里添加相应的命令.

# 暴露 RabbitMQ 端口(可选)
# 如果您希望将 RabbitMQ 的端口暴露给外部,您可以在这里添加相应的 EXPOSE 命令.
# 例如：
#EXPOSE 4369 5671 5672 15691 15692 25672

# 其他自定义配置(可选)
# 如果您有其他自定义配置需求,您可以在这里添加相应的命令.

# 启动 RabbitMQ 服务
ENTRYPOINT ["rabbitmq-server"]
