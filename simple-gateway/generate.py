# -*- coding: utf-8 -*-
import os

config_template = '''user www-data;
worker_processes auto;
pid /run/nginx.pid;
load_module modules/ngx_stream_module.so;

events {{
    worker_connections 1024;
}}

stream {{
    upstream socket_server {{
{}
    }}

    upstream http_server {{
{}
    }}

    server {{
        listen 1081;
        proxy_pass socket_server;
    }}

    server {{
        listen 1080;
        proxy_pass http_server;
    }}
}}
'''

if __name__ == "__main__":
    servers = os.getenv("WORKER_NAMES")
    servers = servers.split(',')
    socket_servers = ["server {}:1081;".format(name) for name in servers]
    socket_servers = '\n'.join(socket_servers)
    http_servers = ["server {}:1080;".format(name) for name in servers]
    http_servers = '\n'.join(http_servers)

    print(config_template.format(socket_servers, http_servers))
