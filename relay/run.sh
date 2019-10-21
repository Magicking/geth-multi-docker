#!/bin/sh

DATA_DIR=/data
gethcmd="/usr/local/bin/geth --datadir "${DATA_DIR}" --cache 4096"
syncmode=fast

case "${NET}" in
	"goerli")
		NET="--goerli"
		;;
	"rinkeby")
		NET="--rinkeby"
		;;
	"ropsten")
		NET="--testnet"
		;;
	*)
		NET=""
		;;
esac

if [ x"${ETHSTATS}" == x ]; then
  ETHSTATS=ethstats
fi

if [ x"${CORS_DOMAIN}" == x ]; then
  CORS_DOMAIN=*
fi

ethstatsip=`dig +short "${ETHSTATS}" | head -n 1`

if [ x"${ethstatsip}" != "x" ] && [ x"${WS_SECRET}" != "x" ]; then
  echo "Reporting stats to ${ethstatsip}"
  statsopts="--ethstats ${HOSTNAME}:${WS_SECRET}@${ethstatsip}:3000"
else
  echo "Not reporting stats, ethstats not present or WS_SECRET not set"
fi

modules="eth,web3,net"

exec $gethcmd \
 --syncmode "$syncmode" \
 --nousb \
 ${NET} \
 --maxpeers 100 \
 ${statsopts} \
 --rpc \
 --rpcvhosts "*" \
 --rpcaddr "0.0.0.0" \
 --rpcapi "${modules}" \
 --rpccorsdomain "${CORS_DOMAIN}" \
 --ws \
 --wsaddr "0.0.0.0" \
 --wsapi "${modules}" \
 --wsorigins "${CORS_DOMAIN}"
