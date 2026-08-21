// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-token-primitives",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Token Primitives",
            targets: ["Token Primitives"]
        ),
        .library(
            name: "Token Primitives Test Support",
            targets: ["Token Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-primitives/swift-text-primitives.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "Token Primitives",
            dependencies: [
                .product(name: "Text Primitives", package: "swift-text-primitives")
            ]
        ),
        .target(
            name: "Token Primitives Test Support",
            dependencies: [
                "Token Primitives",
                .product(name: "Text Primitives Test Support", package: "swift-text-primitives"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Token Primitives Tests",
            dependencies: [
                "Token Primitives",
                "Token Primitives Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
