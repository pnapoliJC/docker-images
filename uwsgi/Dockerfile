FROM sgn0/python
MAINTAINER Jesus Lopez, jesus@sgn.com

# Install uwsgi
RUN UWSGI_VERSION=2.0.13.1 \
    set -ex; \
    apk --no-cache -qt .buildDeps add py-pip python-dev gcc musl-dev linux-headers; \
    CHARSET=UTF-8 pip install -q uwsgi==${UWSGI_VERSION}; \
    strip /usr/bin/uwsgi; \
    find /usr/lib/python2.7 -name '*.py[co]' -print0 | xargs -0 rm; \
    rm -fr /root/.cache; \
    apk --no-cache del .buildDeps

COPY uwsgi.ini /etc/
COPY app /var/www/app/

CMD ["/usr/bin/uwsgi", "--ini", "/etc/uwsgi.ini"]
