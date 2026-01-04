FROM rabbitmq:alpine

# 添加插件到指定目录(可按照此方式自行扩展其他插件)
ADD ./rabbitmq_delayed_message_exchange-*.ez /plugins

RUN set -eux; \
	rabbitmq-plugins enable --offline rabbitmq_management; \
	rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange; \
# make sure the metrics collector is re-enabled (disabled in the base image for Prometheus-style metrics by default)
	rm -f /etc/rabbitmq/conf.d/20-management_agent.disable_metrics_collector.conf; \
# grab "rabbitmqadmin" from inside the "rabbitmq_management-X.Y.Z" plugin folder
# see https://github.com/docker-library/rabbitmq/issues/207
	cp /plugins/rabbitmq_management-*/priv/www/cli/rabbitmqadmin /usr/local/bin/rabbitmqadmin; \
	[ -s /usr/local/bin/rabbitmqadmin ]; \
	chmod +x /usr/local/bin/rabbitmqadmin; \
	apk upgrade --no-cache; \
    apk add --no-cache python3; \
	rm -rf /var/lib/apt/lists/*; \
	rabbitmqadmin --version

# 暴露 RabbitMQ 端口（可选）
# EXPOSE 4369 5671 5672 15691 15692 25672

CMD ["rabbitmq-server"]
