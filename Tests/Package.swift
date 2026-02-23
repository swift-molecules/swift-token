// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-token-primitives-tests",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    dependencies: [
        .package(path: "../"),
    ],
    targets: [
        .testTarget(
            name: "Token Primitives Tests",
            dependencies: [
                .product(name: "Token Primitives", package: "swift-token-primitives"),
                .product(name: "Token Primitives Test Support", package: "swift-token-primitives"),
            ],
            path: "Sources/Token Primitives Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let settings: [SwiftSetting] = [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
    ]
    target.swiftSettings = (target.swiftSettings ?? []) + settings
}
