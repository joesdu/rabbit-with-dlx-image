#!/bin/bash
set -e

# 先以后台模式启动 RabbitMQ 服务
echo "Starting RabbitMQ in background mode..."
rabbitmq-server -detached

# 等待 RabbitMQ 服务启动
until rabbitmqctl status > /dev/null 2>&1; do
    echo "Waiting for RabbitMQ to start..."
    sleep 2
done

# 启用 khepri_db 特性
echo "Enabling khepri_db feature flag..."
rabbitmqctl enable_feature_flag --experimental khepri_db

# 停止后台运行的 RabbitMQ
echo "Stopping background RabbitMQ..."
rabbitmqctl stop
sleep 5

# 以前台模式重新启动 RabbitMQ（用于容器主进程）
echo "Starting RabbitMQ in foreground mode..."
exec rabbitmq-server