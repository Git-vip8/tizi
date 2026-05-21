#!/bin/bash

# 1. 复制配置文件到指定目录
cp ./hy2.json /etc/sing-box/hy2.json
cp ./vless-reality.json /etc/sing-box/vless-reality.json

# 2. 用指定的配置文件启动 sing-box，后台运行
sing-box run -c /etc/sing-box/hy2.json &
sing-box run -c /etc/sing-box/vless-reality.json &

echo "部署完成！Hy2 和 VLESS 节点已启动。"