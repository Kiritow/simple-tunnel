FROM ubuntu-cn-systemd:latest
RUN apt update && apt install -y openssh-client autossh nginx privoxy && rm -rf /var/lib/apt/lists/*
COPY privoxy_config /etc/privoxy/config
COPY nginx.conf /etc/nginx/nginx.conf
COPY start_tunnel.sh /root/
COPY boot-tunnel.service /lib/systemd/system/
RUN systemctl enable boot-tunnel
EXPOSE 1080 1081
