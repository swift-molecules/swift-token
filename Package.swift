// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "swift-token-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
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
        .package(path: "../swift-text-primitives")
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
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
