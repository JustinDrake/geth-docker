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
cat ${CONSENSUS_DATA}/${NETWORK}/validators/api-token.txt
```
