#!/usr/bin/env bash

# -r 19  Sydney
# -r 5 Los Angeles
# -r 2 Chicago
# -r 1 New Jersey
# -r 25 Tokyo
# -p 87 1 CPU, 512MB RAM, 125GB storage, $5/month
# -p 205 6 CPU, 8GB RAM, $80/month
# -o 215 Ubuntu 16.0-4 x64
# -p 116 dedicated 4 CPU, 16GB RAM, 120$/month
# -p 115 dedicated 2 CPU, 16GB RAM, 120$/month

REGION=1
PLAN=116

SERVERS=`vultr servers`
if echo $SERVERS | grep compserv; then
    echo "server exists"
else
    create-script-compserv.sh
    echo "creating server"
    vultr server create -n "compserv" -r ${REGION} -p ${PLAN} -o 215 -k "5917fd9d67361" --script 63694 --hostname="rona" --private-networking=true --notify-activate=true
    rm ~/.unison/ar*
    rm ~/.unison/lk*
fi

while : ; do
    DEETS=$(vultr servers | grep compserv)
    echo $DEETS
    IP=$(echo $DEETS | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
    ID=$(echo $DEETS | grep -Eo "^[^ ]+")
    if [[ "$IP" != "0.0.0.0" ]]; then
        break
    fi
done
echo "IP: $IP"
echo "ID: $ID"
echo $IP > "$GHC_SYNC_TOP_DIR""etc/servers/compserv.IP"
echo $ID > "$GHC_SYNC_TOP_DIR""etc/servers/compserv.ID"

echo "starting unison"

cat << EOF | entr -r "$GHC_SYNC_TOP_DIR""etc/scripts/local-run-unison.sh"
${GHC_SYNC_TOP_DIR}etc/templates/local.prf.mustache
EOF
