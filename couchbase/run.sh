#!/bin/bash
set -e

if [ $# -eq 0 ]; then
    if [ -f couchbase.tgz ]; then
        echo "Initializing database"
        tar xpf couchbase.tgz -C /opt/couchbase/var
        rm couchbase.tgz
    fi
    exec /entrypoint.sh couchbase-server
fi

exec "$@"
