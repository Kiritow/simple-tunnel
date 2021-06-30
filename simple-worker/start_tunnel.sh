#!/bin/bash
set -e

rm -f /tmp/ENV
for e in $(tr "\000" "\n" < /proc/1/environ); do
    echo $e >> /tmp/ENV
done

. /tmp/ENV
rm -f /tmp/ENV

if [[ -z "${TUNNEL_USER}" ]]; then
    TUNNEL_USER=root
fi

if [[ -z "${TUNNEL_PORT}" ]]; then
    TUNNEL_PORT=22
fi

if [[ -z "${TUNNEL_SERVER}" ]]; then
    echo "TUNNEL_SERVER is not defined. Abort." >&2
    shutdown now
    exit 1
fi

autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1180 -i /run/secrets/ssh_key_* $TUNNEL_USER@$TUNNEL_SERVER -p $TUNNEL_PORT
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1181 -i /run/secrets/ssh_key_* $TUNNEL_USER@$TUNNEL_SERVER -p $TUNNEL_PORT
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1182 -i /run/secrets/ssh_key_* $TUNNEL_USER@$TUNNEL_SERVER -p $TUNNEL_PORT
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1183 -i /run/secrets/ssh_key_* $TUNNEL_USER@$TUNNEL_SERVER -p $TUNNEL_PORT
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1184 -i /run/secrets/ssh_key_* $TUNNEL_USER@$TUNNEL_SERVER -p $TUNNEL_PORT
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1185 -i /run/secrets/ssh_key_* $TUNNEL_USER@$TUNNEL_SERVER -p $TUNNEL_PORT
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1186 -i /run/secrets/ssh_key_* $TUNNEL_USER@$TUNNEL_SERVER -p $TUNNEL_PORT
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1187 -i /run/secrets/ssh_key_* $TUNNEL_USER@$TUNNEL_SERVER -p $TUNNEL_PORT
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1188 -i /run/secrets/ssh_key_* $TUNNEL_USER@$TUNNEL_SERVER -p $TUNNEL_PORT
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1189 -i /run/secrets/ssh_key_* $TUNNEL_USER@$TUNNEL_SERVER -p $TUNNEL_PORT

