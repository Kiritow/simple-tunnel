# FROM ubuntu-cn:latest
FROM ubuntu:latest
RUN sed -i 's/archive.ubuntu.com/mirrors.cloud.tencent.com/g; s/security.ubuntu.com/mirrors.cloud.tencent.com/g' /etc/apt/sources.list \
    && rm -f /etc/apt/apt.conf.d/docker-gzip-indexes

# FROM ubuntu-cn-systemd:latest
RUN apt update \
  && echo 'tzdata tzdata/Areas select Asia' >> /root/preseed.cfg \
  && echo 'tzdata tzdata/Zones/Asia select Shanghai' >> /root/preseed.cfg \
  && debconf-set-selections /root/preseed.cfg \
  && rm -f /etc/timezone /etc/localtime \
  && DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true apt install -y systemd \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* /var/tmp/* \
  && rm /root/preseed.cfg \
  && sed 's/ProtectHostname=yes/ProtectHostname=no/g' -i /lib/systemd/system/systemd-logind.service \
  && cd /lib/systemd/system/sysinit.target.wants/ \
  && ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1 \
  && rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/basic.target.wants/* \
    /lib/systemd/system/anaconda.target.wants/* \
    /lib/systemd/system/plymouth* \
    /lib/systemd/system/systemd-update-utmp*
ENTRYPOINT ["/bin/systemd"]

RUN apt update && apt install -y openssh-client autossh nginx privoxy systemd-sysv && rm -rf /var/lib/apt/lists/*
COPY . /root/
RUN cd /root \
  && mv privoxy_config /etc/privoxy/config \
  && mv nginx.conf /etc/nginx/ \
  && ln -s /root/boot-tunnel.service /lib/systemd/system/boot-tunnel.service \
  && systemctl enable boot-tunnel
EXPOSE 1080 1081
