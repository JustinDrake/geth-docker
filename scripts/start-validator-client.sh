#!/bin/sh

if [ "$KEYSTORE_PASSWD" != "" ]; then
    echo $KEYSTORE_PASSWD | lighthouse \
    --network $NETWORK \
    account validator import \
    --directory /root/validator_keys \
    --reuse-password \
    --stdin-inputs
else
    echo "keystore password not set. skipping validator keystore import"
fi

exec lighthouse \
    --network $NETWORK \
    validator \
    --beacon-nodes http://lighthouse:5052
