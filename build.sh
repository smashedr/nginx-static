#!/usr/bin/env bash
set -e

REGISTRY_HOST="registry.hosted-domains.com"
REGISTRY_USER="shane"
REGISTRY_REPO="nginx-static"

if [ -f ".env" ];then
    echo "Sourcing Environment: .env"
    source ".env"
fi
if [ -z "${VERSION}" ];then
    if [ -z "${1}" ];then
        read -rp "Version: " VERSION
    else
        VERSION="${1}"
    fi
fi
if [ -z "${USERNAME}" ];then
    read -rp "Username: " USERNAME
fi
if [ -z "${PASSWORD}" ];then
    read -rp "Password: " PASSWORD
fi

echo "${REGISTRY_HOST}/${REGISTRY_USER}/${REGISTRY_REPO}:${VERSION}"

docker login --username "${USERNAME}" --password "${PASSWORD}" "${REGISTRY_HOST}"

docker build --tag "${REGISTRY_HOST}/${REGISTRY_USER}/${REGISTRY_REPO}:${VERSION}" nginx

docker push "${REGISTRY_HOST}/${REGISTRY_USER}/${REGISTRY_REPO}:${VERSION}"
