// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-token",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Token",
            targets: ["Token"]
        ),
        .library(
            name: "Token Standard Library Integration",
            targets: ["Token Standard Library Integration"]
        ),
        .library(
            name: "Token Apple Foundation Integration",
            targets: ["Token Apple Foundation Integration"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-text.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "Token",
            dependencies: [
                .product(name: "Text", package: "swift-text")
            ]
        ),
        .target(
            name: "Token Standard Library Integration",
            dependencies: [.target(name: "Token")]
        ),
        .target(
            name: "Token Apple Foundation Integration",
            dependencies: [
                .target(name: "Token"),
                .target(name: "Token Standard Library Integration"),
            ]
        ),
        .testTarget(
            name: "Token Tests",
            dependencies: [.target(name: "Token"), .product(name: "Text", package: "swift-text")]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("Lifetimes"),
        .treatAllWarnings(as: .error),
    ]
}
