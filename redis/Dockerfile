FROM redis:3.2.5-alpine
MAINTAINER Paul Ashdown, paul@sgn.com

COPY redis.conf /usr/local/etc/redis/redis.conf
RUN set -x; \
    mkdir -p /usr/local/var/db/redis
ENTRYPOINT [ "redis-server", "/usr/local/etc/redis/redis.conf"]
