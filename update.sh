#!/bin/sh

update() {
	n=relay"$1"

	docker-compose stop "$n" && \
	docker-compose rm -f "$n" && \
	docker-compose build "$n" && \
	docker-compose create "$n" && \
	docker-compose start "$n"
}

docker pull ethereum/client-go:alltools-latest
case "$1" in
	ropsten)
		update "$1"
	;;
	rinkeby)
		update "$1"
	;;
	goerli)
		update "$1"
	;;
	*)
	echo "See update.sh for usage (ropsten, rinkeby, goerli)"
	;;
esac
