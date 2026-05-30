#!/bin/bash

# 0. 设置环境变量
export ENABLE_DEPRECATED_LEGACY_DNS_SERVERS=true
export ENABLE_DEPRECATED_MISSING_DOMAIN_RESOLVER=true

# 1. 创建证书目录并生成自签名证书
mkdir -p /etc/sing-box/certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/sing-box/certs/private.key \
  -out /etc/sing-box/certs/cert.pem \
  -subj "/CN=www.google.com"

# 2. 复制配置文件到指定目录
cp ./hy2.json /etc/sing-box/hy2.json
cp ./vless-reality.json /etc/sing-box/vless-reality.json

# 3. 用指定的配置文件启动 sing-box，后台运行
sing-box run -c /etc/sing-box/hy2.json &
sing-box run -c /etc/sing-box/vless-reality.json &

echo "部署完成！Hy2 和 VLESS 节点已启动。"