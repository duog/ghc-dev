#!/usr/bin/env bash

echo "creating key"
vultr sshkey update 5917fd9d67361 -f ~/.ssh/id_rsa.pub

echo "creating script"
pushd "$GHC_SYNC_TOP_DIR""etc/templates"
echo "" | mustache - boot-compserv.mustache > "$GHC_SYNC_TOP_DIR""etc/scripts/boot-compserv"
popd
vultr script update 63694 -f "$GHC_SYNC_TOP_DIR""etc/scripts/boot-compserv"
