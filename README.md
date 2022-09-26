# geth-docker
A docker-compose environment for running Geth+Lighthouse

## Usage

### Configure and start

1. ```bash
   cp .env.example .env
   ```
1. Edit `.env`
1. Create JWT secret and save it in `jwtsecret.txt`. E.g. run
   ```sh
   openssl rand -hex 32 | tr -d "\n" > "jwtsecret.txt"
   ```
1. ```bash
   ./start.sh
   ```

### Stop

1. ```bash
   docker-compose down
   ```

### Get keymanager API auth token

```bash
cat ${VALIDATOR_DATA}/${NETWORK}/validators/api-token.txt
```

### (Optional) Sync from a trusted node

Run the following commands in shell to fetch the current state of the consensus layer chain.

```sh
# Set a working Beacon API URL here. Does not need to be provided by Infura
beacon_api_url=https://272GSCR2NRpg5n55qsSc4y5sMD8:4c9e4d691e34ge523456bb29f3e0332f@eth2-beacon-mainnet.infura.io
# Use e.g. "mainnet" or "goerli" here
eth_network=mainnet

mkdir lighthouse-snapshot
docker run -i --rm \
    -v ${PWD}/lighthouse-snapshot:/root/.lighthouse \
    sigp/lighthouse:latest lighthouse bn --checkpoint-sync-url=${beacon_api_url} --network=${eth_network} --shutdown-after-sync --disable-upnp
```

Wait until the log message "Loaded checkpoint block and state".
Press `Ctrl+C` to exit.
Now check that the checkpoint block root hash (printed in the log message) is that of the canonical chain (compare to block explorers, friends etc.).
Then move the content of `lighthouse-snapshot/` to your `$CONSENSUS_DATA` directory.
