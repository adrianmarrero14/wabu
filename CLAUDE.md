# Wabu

Monorepo for Wabu, a personal finance system: automatic sync of bank, exchange and payment-processor transactions, with analysis, visualization and export on top. Product context (vision, scope, open decisions) lives in Linear under the **WABU** initiative (projects *WABU API*, *WABU iOS*, *WABU Dashboard*).

## Layout

- `api/` — `wabu-api`, FastAPI backend (sync via Enable Banking / API keys, normalization, persistence in Firefly III, BFF for the clients). Rules in `api/CLAUDE.md`.
- `ios/` — iOS app (SwiftUI). Rules in `ios/CLAUDE.md`.
- Future clients (`dashboard/`) go in new top-level folders with their own `CLAUDE.md`.

## Design principles

- Don't rebuild what Firefly III already solves (double-entry, rules, multi-currency, recurrences). Own effort goes into sync and visualization.
- The API is the single source of truth: clients (iOS, dashboard) hold no duplicated business logic.
- Built for one user. No multi-user/multi-tenant work until there's a concrete reason.

## Language conventions

- Everything is written in English: code, comments, docs, commit messages, and the `CLAUDE.md` files.
- User-facing text is localized in Spanish (source language) and English.

## Git

- Only two branches: `develop` and `main`. Never create other branches (no `feature/…`, `chore/…`, etc.).
- All work is committed on `develop`. Merge `develop` into `main` only when explicitly asked.
- A change spanning several projects (e.g. an API endpoint plus the iOS code using it) goes in a single PR.
