#!/usr/bin/env sh
set -e

echo "Running: set-perms.sh"
echo "SUID: ${SUID}"

if [ -n "${SUID}" ];then
    echo "Setting Permissions ${SUID}:${SUID} on /static"
    chown -R "${SUID}:${SUID}" "/static"
fi

echo "Done"
