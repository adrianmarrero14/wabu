import SwiftUI
import WabuCore

struct ContentView: View {
    let apiClient: APIClient

    @State private var apiStatus: APIStatus = .checking

    var body: some View {
        NavigationStack {
            List {
                Section("home.section.api") {
                    LabeledContent("home.api.status") {
                        Text(apiStatus.label)
                            .foregroundStyle(apiStatus.color)
                    }
                }
            }
            .navigationTitle("home.title")
            .refreshable { await checkAPI() }
            .task { await checkAPI() }
        }
    }

    private func checkAPI() async {
        do {
            let health = try await apiClient.health()
            apiStatus = health.isOK ? .online : .offline
        } catch {
            apiStatus = .offline
        }
    }
}

private enum APIStatus {
    case checking, online, offline

    var label: LocalizedStringResource {
        switch self {
        case .checking: "home.api.status.checking"
        case .online: "home.api.status.online"
        case .offline: "home.api.status.offline"
        }
    }

    var color: Color {
        switch self {
        case .checking: .secondary
        case .online: .green
        case .offline: .red
        }
    }
}

#Preview {
    ContentView(apiClient: APIClient(baseURL: AppEnvironment.apiBaseURL))
}
