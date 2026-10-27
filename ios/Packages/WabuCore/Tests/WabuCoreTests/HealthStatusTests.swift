import Foundation
import Testing
@testable import WabuCore

struct HealthStatusTests {
    @Test func decodesHealthyResponse() throws {
        let data = Data(#"{"status":"ok"}"#.utf8)

        let health = try JSONDecoder().decode(HealthStatus.self, from: data)

        #expect(health == HealthStatus(status: "ok"))
        #expect(health.isOK)
    }

    @Test func unknownStatusIsNotOK() {
        #expect(!HealthStatus(status: "degraded").isOK)
    }
}
