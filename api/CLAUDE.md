# Wabu API

FastAPI backend (`wabu-api`). Repo-wide rules (language, principles, git) live in the root `CLAUDE.md`.

## Tooling

- Python 3.13 managed by uv. Use `uv add` / `uv add --dev` for dependencies (ask before adding new ones) and `uv run` for every command.
- Before finishing a change: `uv run pytest`, `uv run ruff check .` and `uv run ruff format --check .` must pass.

## Structure

- Source lives in `src/wabu_api/` (installable package); tests in `tests/`.
- `main.py` builds the app via `create_app()`; tests get a fresh app through the `client` fixture in `tests/conftest.py`.
- Each resource gets a module in `routers/` exposing `router`, included in `create_app()`.
- Configuration only through `core/config.py` (`Settings`, env vars prefixed `WABU_`, read via `get_settings()`). Never read `os.environ` directly; document every new variable in `.env.example`.
- Request and response bodies are Pydantic models; endpoints declare their return type.

## Clients

The iOS app (`../ios`, `WabuCore.APIClient`) consumes this API. Contract changes that a client depends on go in the same PR as the client change.
