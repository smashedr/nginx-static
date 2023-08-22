#!/usr/bin/env sh
set -e

echo "Running: set-perms.sh"

echo "STATIC: ${STATIC:-/static}"
echo "SUID: ${SUID:-1000}"

#if [ -n "${SUID}" ];then
echo "Setting Permissions ${SUID:-1000}:${SUID:-1000} on ${STATIC:-/static}"
chown -R "${SUID:-1000}:${SUID:-1000}" "${STATIC:-/static}"
#fi

echo "Done"
