### Node relay

Simple ethereum relay node without security for Ropsten, Rinkeby and Göerli

## Environments

 * SECRET:       Ethstats password
 * CORS_DOMAIN:  Cross-Origin Resource Sharing, default to *

## Configuration

 - UserID set to 1001
 - No USB
 - Syncmode is fast
 - Maximum peers is set to 100
 - Modules enabled to eth,web3,net
 - WebSocket is enabled 
 - Memory usage for caching set to 4 Go

## Usefuls commands

 * `./update.sh goerli` to update your node to latest [ethereum/client-go:alltools-latest](https://hub.docker.com/r/ethereum/client-go/)

 * `docker-compose exec relayropsten /usr/local/bin/geth --datadir /data attach` to attach to console with full admin access
