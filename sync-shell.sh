#!/usr/bin/env bash
export GHC_SYNC_TOP_DIR=/home/doug/ghc-dev/
export VULTR_API_KEY=$(cat "$GHC_SYNC_TOP_DIR""etc/private/vultr-api-key")
export PATH="$GHC_SYNC_TOP_DIR""etc/scripts:$PATH"

bash
