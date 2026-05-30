#!/usr/bin/env python3
"""节点链接转订阅编码脚本"""

import base64

def encode_subscription(links):
    """将多个节点链接合并为订阅编码"""
    raw = "\n".join(links)
    encoded = base64.b64encode(raw.encode()).decode()
    return encoded

if __name__ == "__main__":
    # 在这里填入你的节点链接
    nodes = [
        "hysteria2://Tz123456@43.131.225.218:443?sni=www.google.com&insecure=1#Tencent-Hy2",
        "vless://06f1805c-d31a-42a2-a0e6-a4ad476cd89f@43.131.225.218:8443?type=tcp&security=reality&pbk=0qNolE95MxKMmT1Ymlj5bhxEH0TKXC0N0e0M9P8T81E&fp=chrome&sni=www.apple.com&sid=717f6e79b0fb00cc&spx=%2F#Tencent-VLESS"
    ]
    
    result = encode_subscription(nodes)
    print("编码后的订阅内容：")
    print(result)
    print("\n可直接保存为 subscribe.txt 上传到 GitHub")