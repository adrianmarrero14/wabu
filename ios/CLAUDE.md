# Wabu iOS

Wabu iOS app (SwiftUI, Swift 6, iOS 26+, iPhone only; modular architecture with local SPM packages in `Packages/`). Repo-wide rules (language, principles, git) live in the root `CLAUDE.md`.

## Project

- `Wabu.xcodeproj` uses file-system synchronized groups: files added under `Wabu/` are picked up automatically, no project edits needed.
- New packages go in `Packages/<Name>/` (swift-tools-version 6.2, platforms `.iOS(.v26), .macOS(.v26)` so `swift test` runs on the Mac) and must be added to the app target in Xcode.
- The app target uses `MainActor` default isolation and approachable concurrency.
- Verify changes with `xcodebuild -project Wabu.xcodeproj -scheme Wabu -destination 'platform=iOS Simulator,name=iPhone 17' build` and `swift test` in each touched package.

## Localization

Never hardcode user-facing strings: use String Catalogs (`Localizable.xcstrings`) with dotted keys like `home.api.status`, source language `es`, and a translated `en` entry for every key. In packages, load with `.module` as the bundle.

## Backend

All data comes from `wabu-api` (`../api`) through `WabuCore.APIClient`. No business logic in the app: categorization, normalization and aggregation belong to the API. Contract changes go in the same PR, under `api/`.
