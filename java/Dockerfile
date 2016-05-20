FROM sgn0/baseimage
MAINTAINER Jesus Lopez <jesus@sgn.com>

RUN set -ex; \
    apk -q --no-cache -t .zipDeps add zip unzip; \
    apk -q --no-cache add openjdk8-jre-base; \
    set +x; \
    for jar in $(find /usr/lib/jvm -name '*.jar'); do \
      echo "Recompressing $jar"; \
      mkdir jar; \
      cd jar; \
      unzip -q $jar; \
      zip -9qr $jar .; \
      cd /; \
      rm -fr jar; \
    done; \
    set -x; \
    apk -q --no-cache del .zipDeps
