FROM redis:3.2.5-alpine

LABEL maintainer="Paul Ashdown, paul@jamcity.com"

COPY redis.conf /usr/local/etc/redis/redis.conf
RUN set -x; \
    mkdir -p /usr/local/var/db/redis
ENTRYPOINT [ "redis-server", "/usr/local/etc/redis/redis.conf"]
