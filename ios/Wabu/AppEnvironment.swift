import Foundation

enum AppEnvironment {
    /// Base URL of `wabu-api`. Debug builds point to the API running locally (`uv run uvicorn wabu_api.main:app --reload`).
    static let apiBaseURL: URL = {
        #if DEBUG
        URL(string: "http://localhost:8000")!
        #else
        // TODO: Point to the deployed API once it exists.
        URL(string: "http://localhost:8000")!
        #endif
    }()
}
