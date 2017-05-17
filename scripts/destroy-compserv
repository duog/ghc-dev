#!/usr/bin/env bash

vultr server delete $(cat "$GHC_SYNC_TOP_DIR""etc/servers/compserv.ID")

if [ "`echo $?`" -eq "0" ] ; then
  rm "$GHC_SYNC_DIR_TOP""etc/servers/compserv"*
fi
