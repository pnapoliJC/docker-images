FROM couchbase:4.1.0
MAINTAINER Jesus Lopez, jesus@sgn.com

# Increase Admin UI document edit limit
RUN sed -i 's/docBytesLimit: 2500,/docBytesLimit: 1048576,/' /opt/couchbase/lib/ns_server/erlang/lib/ns_server/priv/public/js/documents.js

# Fetch wait-for-it.sh. Using a commit hash to avoid future breakage.
WORKDIR /usr/local/bin
RUN curl -fsO https://raw.githubusercontent.com/vishnubob/wait-for-it/55c54a5abdfb32637b563b28cc088314b162195e/wait-for-it.sh && \
    chmod 755 wait-for-it.sh

# Init buckets
WORKDIR /root
ENV CB_USER root
ENV CB_PASSWORD secret
COPY start-couchbase.sh .
RUN ./start-couchbase.sh && \
    wait-for-it.sh localhost:8091 -s && \
    curl -fsX POST http://localhost:8091/pools/default -d memoryQuota=256 && \
    couchbase-cli cluster-init -clocalhost --cluster-ramsize=256 --cluster-index-ramsize=256 --cluster-username=$CB_USER --cluster-password=$CB_PASSWORD --services=data,index,query && \
    couchbase-cli bucket-create -clocalhost -u$CB_USER -p$CB_PASSWORD --bucket=default --bucket-type=couchbase --bucket-ramsize=128 --bucket-replica=0 --enable-flush=1 --wait && \
    couchbase-cli bucket-create -clocalhost -u$CB_USER -p$CB_PASSWORD --bucket=admin --bucket-type=couchbase --bucket-ramsize=128 --bucket-replica=0 --enable-flush=1 --wait && \
    couchbase-server -k && \
    sleep 5 && \
    tar czpf couchbase.tgz -C /opt/couchbase/var --exclude=lib/couchbase/logs . && \
    rm start-couchbase.sh

COPY run.sh .
ENTRYPOINT [ "./run.sh" ]
