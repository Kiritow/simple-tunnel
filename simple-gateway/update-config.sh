#!/bin/bash
set -xe

cd /root
rm -f ENV
for e in $(tr "\000" "\n" < /proc/1/environ); do
    echo $e >> ENV
done

. ENV
rm -f ENV

if [[ =z "${PROXY_SERVERS}" ]]; then
    echo "PROXY_SERVERS is not defined. Abort." >&2
    shutdown now
    exit 1
fi

echo 'Generate Nginx Config...'
python3 generate.py > nginx.conf
mv nginx.conf /etc/nginx/
systemctl restart nginx

