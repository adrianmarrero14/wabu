import SwiftUI
import WabuCore

@main
struct WabuApp: App {
    private let apiClient = APIClient(baseURL: AppEnvironment.apiBaseURL)

    var body: some Scene {
        WindowGroup {
            ContentView(apiClient: apiClient)
        }
    }
}
