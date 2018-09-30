#!/bin/sh

DATA_DIR=/data
ETHSTATS_NAME=ethstats
gethcmd="/usr/local/bin/geth --datadir "${DATA_DIR}" --cache 512"

if [ x"${CORS_DOMAIN}" == x ]; then
  CORS_DOMAIN=*
fi

ethstatsip=`dig +short "${ETHSTATS_NAME}" | head -n 1`

if [ x"${ethstatsip}" != "x" ] && [ x"${WS_SECRET}" != "x" ]; then
  echo "Reporting stats to ${ethstatsip}"
  statsopts="--ethstats ${HOSTNAME}:${WS_SECRET}@${ethstatsip}:3000"
else
  echo "Not reporting stats, ethstats not present or WS_SECRET not set"
fi

modules="eth,web3,net"

exec $gethcmd \
 --syncmode fast \
 --rinkeby \
 --maxpeers 100 \
 ${statsopts} \
 --ws \
 --wsaddr "0.0.0.0" \
 --wsapi "${modules}" \
 --wsorigins "${CORS_DOMAIN}"
