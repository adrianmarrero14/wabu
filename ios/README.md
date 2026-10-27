# Wabu iOS

The Wabu iOS app: browse your finances and categorize transactions quickly, on top of `wabu-api`.

## Architecture

SwiftUI app with a modular structure based on local Swift Package Manager packages:

```
ios
├── Wabu/                 # App target (entry point, environment, root views)
├── Wabu.xcodeproj
└── Packages/
    └── WabuCore/         # Shared models and the `wabu-api` HTTP client
```

New features go in their own packages under `Packages/` and are added to the app target.

The backend lives in [`../api`](../api/README.md).

## Requirements

- Xcode 26 or later
- iOS 26 or later (iPhone)

## Getting started

1. Start the API locally (see [`../api`](../api/README.md)); Debug builds use `http://localhost:8000`.
2. Open `ios/Wabu.xcodeproj` in Xcode.
3. Select the `Wabu` scheme and run on a simulator. Local packages resolve automatically.

Package tests: `cd Packages/WabuCore && swift test`.
