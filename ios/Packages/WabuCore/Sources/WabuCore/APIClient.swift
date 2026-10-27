import Foundation

/// HTTP client for `wabu-api` (see `api/` at the repo root).
public struct APIClient: Sendable {
    public let baseURL: URL
    private let session: URLSession
    private let decoder = JSONDecoder()

    public init(baseURL: URL, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }

    public func health() async throws -> HealthStatus {
        try await get("health")
    }

    func get<Response: Decodable>(_ path: String) async throws -> Response {
        let (data, response) = try await session.data(from: baseURL.appending(path: path))
        guard let http = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        guard (200..<300).contains(http.statusCode) else {
            throw APIError.unexpectedStatus(http.statusCode)
        }
        return try decoder.decode(Response.self, from: data)
    }
}

public enum APIError: Error, Equatable {
    case invalidResponse
    case unexpectedStatus(Int)
}
