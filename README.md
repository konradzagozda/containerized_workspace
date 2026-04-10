# Workspace

Sandbox environment designed to safely work with AI agents

## Features:
- Network isolation - Primary `workspace` container is located in private network with no internet access, all internet traffic goes through Squid Proxy with domain allowlisting functinality that is configured outside of AI agent reach. Proxy is placed within two networks, private and public, enabling indirect internet access for private `workspace` node. 
- Filesystem isolation - `./projects` directory is mounted from a host filesystem into container, it's the only host directory that can be modified from both host and an agent.

## Quick Start

1. Install requirements: 
    - `docker`
    - `docker compose`
2. Set up environment variables `cp example.env .env` - fill missing environment variable values, e.g. `GEMINI_API_KEY`, key can be created here: [aistudio](https://aistudio.google.com/app/api-keys)
3. Bootstrap infrastructure: `docker compose up -d`
4. Open shell within workspace node: `docker compose exec workspace bash`

## Commands

- `docker compose build`
- `docker compose up -d`
- `docker compose exec workspace bash`
- `docker compose logs -f proxy`

## DNS White Listing

By default requests are denied, unless present in `allowed-sites.txt`

### Allow

![gemini_query](docs/img/gemini_query.png)

![allow_gemini](docs/img/allow_gemini.png)

### Deny

![block_non_whitelisted](docs/img/block_non_whitelisted.png)

![block_non_whitelisted_log](docs/img/block_non_whitelisted_log.png)


### Allowlisting Domains

1. Watch proxy logs for allowed/denied traffic: `docker compose logs -f proxy`
2. Additional domains can be added by extending `allowed-sites.txt`

For example to allow package installation `apt install cowsay` - `.ports.ubuntu.com` could be added.
