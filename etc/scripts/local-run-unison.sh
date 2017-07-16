#!/usr/bin/env bash

while : ; do
    cat << EOF | mustache - "$GHC_SYNC_TOP_DIR""etc/templates/local.prf.mustache" > ~/.unison/local.prf
topdir: $GHC_SYNC_TOP_DIR
compservip: $(cat "$GHC_SYNC_TOP_DIR""etc/servers/compserv.IP")
EOF
    unison local
    sleep 1
done
