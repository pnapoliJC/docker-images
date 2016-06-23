FROM sgn0/java
MAINTAINER Jesus Lopez <jesus@sgn.com>

ENV ZK_HOME /opt/zookeeper
RUN ZOOKEEPER_VERSION=3.4.8 \
    set -ex; \
    apk --no-cache -qt .deps add tar; \
    mkdir -p ${ZK_HOME} /var/zookeeper; \
    cd ${ZK_HOME}; \
    wget -qO- http://apache.cs.utah.edu/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz | \
        tar xzf - --strip-components=1; \
    mv dist-maven/zookeeper-${ZOOKEEPER_VERSION}.jar .; \
    rm -fr build.xml contrib dist-maven docs ivy* recipes src; \
    apk --no-cache -q del .deps; \
    apk --no-cache add bash

COPY zoo.cfg ${ZK_HOME}/conf
COPY zk /usr/bin

EXPOSE 2181 2888 3888

VOLUME ["/var/zookeeper"]

CMD ["/usr/bin/zk"]
