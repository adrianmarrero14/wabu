# Wabu

Personal finance, made simple.

Wabu syncs every relevant money source (banks via open banking, exchanges, payment processors) into a single ledger and lets you analyze, visualize and export it without the limits of a closed app.

Work in progress. Follow along at [adrianmarrero.com](https://adrianmarrero.com).

## Monorepo layout

| Folder | What | Stack |
|---|---|---|
| [`api/`](api/README.md) | `wabu-api`: sync, normalization and BFF for the clients | Python 3.13, FastAPI, uv |
| [`ios/`](ios/README.md) | iOS app: browse finances and categorize quickly | SwiftUI, iOS 26 |
| `dashboard/` | Web dashboard for deep analysis and export (planned) | — |

## Quick start

```sh
# API — http://localhost:8000 (docs at /docs)
cd api && uv sync && uv run uvicorn wabu_api.main:app --reload

# iOS — open in Xcode and run the "Wabu" scheme
open ios/Wabu.xcodeproj
```
