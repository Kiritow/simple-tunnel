# Simple Tunnel

基于SSH/Socks5 + Nginx + Privoxy实现HTTP代理

## Build

推荐使用[Podman](https://github.com/containers/podman)作为容器管理与运行工具.

`podman build . -t simple-tunnel`

## Deploy

使用前需要先新建[Secret](https://github.com/containers/podman/blob/master/docs/source/markdown/podman-secret.1.md). 注意key前缀必须是`ssh_key_`, config前缀必须是`ssh_config_`. 例如:

`podman secret create ssh_key_1 ~/.ssh/id_rsa`

`podman secret create ssh_config_1 ~/.ssh/config`

启动容器. 注意每个容器内只能载入一对key和config. 且config中远程服务器的名称必须是`remote-server`.

`podman run --secret ssh_key_1 --secret ssh_config_1 -P -d simple-tunnel`

或显示指定端口 (1080是HTTP代理端口, 1081是Socks5聚合端)

`podman run --secret ssh_key_1 --secret ssh_config_1 -p 1081:1081 -p 1080:1080 -d simple-tunnel`

## Notice

当前版本镜像内跳过了SSH Host Key校验. 为了安全请确保目标主机无误的情况下再开始链接.
