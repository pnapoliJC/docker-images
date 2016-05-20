FROM python:2-alpine
MAINTAINER Jesus Lopez <jesus@sgn.com>

RUN set -x && \
    echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk add --no-cache \
        nano \
        runit@testing==2.1.2-r3 \
        && \
    rm /etc/init.d/runitd && \
    mkdir -p /etc/my_init.d

COPY profile.d /etc/profile.d/
COPY my_init /sbin/

CMD ["/sbin/my_init"]
