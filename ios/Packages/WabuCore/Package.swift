// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "WabuCore",
    platforms: [.iOS(.v26), .macOS(.v26)],
    products: [
        .library(name: "WabuCore", targets: ["WabuCore"]),
    ],
    targets: [
        .target(name: "WabuCore"),
        .testTarget(name: "WabuCoreTests", dependencies: ["WabuCore"]),
    ]
)
