#!/usr/bin/env bash

set -e  # Exit immediately if a command exits with a non-zero status.
set -a  # Mark variables which are modified or created for export.

# Set (and export) env variables
source .env

# Make sure data dirs are created without root being the owner
mkdir -p ${EXECUTION_DATA}
mkdir -p ${CONSENSUS_DATA}
mkdir -p ${VALIDATOR_DATA}

if [ "$ENABLE_MEVBOOST" != "" ]; then
    # docker-compose decides which profiles to use based on this variable
    COMPOSE_PROFILES="mevboost"
    # These are CLI args for Nimbus
    LIGHTHOUSE_BN_MEVBOOST_FLAGS="--builder=http://mevboost:18550"
    LIGHTHOUSE_VC_MEVBOOST_FLAGS="--builder-proposals"
fi

docker-compose pull
docker-compose down
docker-compose up -d
