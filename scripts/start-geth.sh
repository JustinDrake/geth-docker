#!/bin/sh
#
# Starts a local fast-synced geth node.

exec geth \
    --networkid $ETH_NETWORK_ID \
    --port $P2P_PORT \
    --maxpeers $MAX_PEERS \
    --http --http.port $HTTP_PORT --http.addr "0.0.0.0" --http.vhosts=* --http.api "eth,net" \
    --ipcdisable \
    --nousb
