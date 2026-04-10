# Workspace

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
