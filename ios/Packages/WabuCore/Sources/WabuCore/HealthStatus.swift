/// Response of `GET /health`.
public struct HealthStatus: Decodable, Equatable, Sendable {
    public let status: String

    public init(status: String) {
        self.status = status
    }

    public var isOK: Bool { status == "ok" }
}
