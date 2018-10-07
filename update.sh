#!/bin/sh

case "$1" in
	ropsten)
	docker pull ethereum/client-go
docker-compose stop relayropsten && docker-compose rm -f relayropsten && docker-compose build relayropsten && docker-compose create relayropsten && docker-compose start relayropsten
	;;
	rinkeby)
	docker pull ethereum/client-go
docker-compose stop relayrinkeby && docker-compose rm -f relayrinkeby && docker-compose build relayrinkeby && docker-compose create relayrinkeby && docker-compose start relayrinkeby
	;;
	*)
	echo "See update.sh for usage (ropsten or rinkeby)"
	;;
esac
