#!/bin/bash
set -e

mkdir -p /root/.ssh
cp /run/secrets/ssh_config_* /root/.ssh/config
cp /run/secrets/ssh_key_* /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1180 remote-server
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1181 remote-server
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1182 remote-server
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1183 remote-server
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1184 remote-server
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1185 remote-server
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1186 remote-server
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1187 remote-server
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1188 remote-server
autossh -M 0 -o StrictHostKeyChecking=no -fNCD 1189 remote-server
