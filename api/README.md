# Wabu API

`wabu-api`, the Wabu backend. It syncs transactions from banks (Enable Banking: BBVA, Revolut) and other sources (Binance, Stripe), normalizes them, stores them in Firefly III, and exposes the data to the Wabu clients (iOS, dashboard).

## Requirements

- [uv](https://docs.astral.sh/uv/) (installs Python 3.13 automatically)

## Getting started

```sh
cp .env.example .env
uv sync
uv run uvicorn wabu_api.main:app --reload
```

The API runs at http://localhost:8000, with interactive docs at http://localhost:8000/docs.

## Development

```sh
uv run pytest            # tests
uv run ruff check .      # lint
uv run ruff format .     # format
```

## Structure

```
api
├── src/wabu_api/
│   ├── main.py          # App factory (`create_app`) and ASGI `app`
│   ├── core/config.py   # Settings from env vars (`WABU_` prefix)
│   └── routers/         # One module per resource, each exposing `router`
└── tests/
```
