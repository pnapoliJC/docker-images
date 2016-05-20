FROM sgn0/baseimage
MAINTAINER Jesus Lopez, jesus@sgn.com

# Install uwsgi
RUN UWSGI_VERSION=2.0.13 \
    set -ex && \
    apk add --no-cache --virtual .buildDeps gcc musl-dev linux-headers && \
    pip install -q uwsgi==${UWSGI_VERSION} && \
    strip /usr/local/bin/uwsgi && \
    find /usr/local/lib/python2.7 -name '*.py[co]' -print0 | xargs -0 rm && \
    rm -fr /root/.cache && \
    apk --no-cache del .buildDeps

COPY etc /etc/
COPY app /var/www/app/
