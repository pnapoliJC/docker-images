FROM sgn0/java
MAINTAINER Jesus Lopez <jesus@sgn.com>

COPY jmx.patch /usr/src/
RUN KAFKA_VERSION=0.10.0.0 \
    GRADLE_VERSION=2.13 \
    set -ex; \
    apk --no-cache -qt .deps add bash openjdk8 libstdc++ tar; \
    cd /usr/src; \
    wget -qOgradle.zip http://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip; \
    unzip -q gradle.zip; \
    rm gradle.zip; \
    wget -qO- http://apache.cs.utah.edu/kafka/${KAFKA_VERSION}/kafka-${KAFKA_VERSION}-src.tgz | \
        tar xzf - -C/usr/src; \
    cd kafka-${KAFKA_VERSION}-src; \
    patch -p1 -i../jmx.patch; \
    rm ../jmx.patch; \
    ../gradle-${GRADLE_VERSION}/bin/gradle -q; \
    ./gradlew -q releaseTarGz_2_11 -x signArchives; \
    mkdir -p /opt/kafka; \
    tar xzf core/build/distributions/kafka_2.11-${KAFKA_VERSION}.tgz -C/opt/kafka --strip-components=1; \
    cd /; \
    rm -fr /usr/src/* ~/.gradle; \
    apk --no-cache del .deps

ENV KAFKA_HOME=/opt/kafka
RUN set -ex; \
    apk --no-cache -q add bash

COPY bin /usr/bin/
VOLUME ["/var/kafka"]

CMD ["/usr/bin/kafka"]
