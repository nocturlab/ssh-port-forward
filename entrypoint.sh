#!/bin/sh
echo -e "${SSH_KEY}" > ./id_rsa
chmod 600 ./id_rsa

echo "Forward ssh to ${REMOTE_HOST}:${REMOTE_PORT}"

/usr/bin/autossh -M 0 -N -v -R "${REMOTE_PORT:-0.0.0.0:2222}:${PORT:-localhost:22}" -oServerAliveInterval=10 -oServerAliveCountMax=2 -oStrictHostKeyChecking=no -i ./id_rsa ${REMOTE_USER:-root}@${REMOTE_HOST:-localhost} -p ${SSH_PORT:-22}
