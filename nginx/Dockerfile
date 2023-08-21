FROM nginx:alpine-slim

ENV TZ=UTC

COPY nginx.conf /etc/nginx/nginx.conf

COPY --chmod=0755 set-perms.sh /docker-entrypoint.d/
