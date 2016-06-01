FROM sgn0/baseimage
MAINTAINER Jesus Lopez, jesus@sgn.com

# nginx
RUN NGINX_VERSION=1.10.1-r0 \
    set -ex; \
    apk add --no-cache nginx@edge==${NGINX_VERSION}

COPY service /etc/service/
COPY conf /etc/nginx/
COPY bin /usr/sbin/

RUN set -ex; \
    ln -s /usr/sbin/nginx_ensite /usr/sbin/nginx_dissite; \
    nginx_ensite default
