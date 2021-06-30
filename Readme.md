# Simple Tunnel

基于SSH/Socks5 + Privoxy + Nginx实现HTTP代理

推荐使用 [Podman](https://github.com/containers/podman) 作为容器运行时.

基于 [Docker Compose](https://github.com/docker/compose) 容器编排工具.

注: 需要先启用 Podman Unix Socket 才能使用 `docker-compose`.

`sudo systemctl start podman.socket`

`systemctl --user start podman.socket`

注: Rootless模式下, 当前版本`docker-compose`可能需要`ln -s /usr/bin/podman ~/.local/bin/docker`, 否则会提示 `FileNotFoundError: [Errno 2] No such file or directory: 'docker'`

## Build

`sudo docker-compose -H unix:///run/podman/podman.sock build`

`docker-compose -H unix:///run/user/1000/podman/podman.sock build`

## Deploy

注: 部署前请先编辑 [docker-compose.yml](docker-compose.yml) 中的环境变量, 或新建 `docker-compose.override.yml` 并覆盖原始配置.

`sudo docker-compose -H unix:///run/podman/podman.sock up -d`

`docker-compose -H unix:///run/user/1000/podman/podman.sock up -d`
