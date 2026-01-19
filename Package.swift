// swift-tools-version: 6.2

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
        )
    ],
    dependencies: [
        .package(path: "../swift-source-primitives"),
        .package(path: "../swift-text-primitives")
    ],
    targets: [
        .target(
            name: "Token Primitives",
            dependencies: [
                .product(name: "Source Primitives", package: "swift-source-primitives"),
                .product(name: "Text Primitives", package: "swift-text-primitives")
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let settings: [SwiftSetting] = [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableExperimentalFeature("Lifetimes"),
        .strictMemorySafety()
    ]
    target.swiftSettings = (target.swiftSettings ?? []) + settings
}
