// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SKArchitekkt",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "SKArchitekkt",
            targets: ["SKArchitekkt"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Lausbert/CoreArchitekkt",
            .upToNextMajor(from: Version(0, 0, 0)
            )
        )
    ],
    targets: [
        .target(
            name: "SKArchitekkt",
            dependencies: ["CoreArchitekkt"]
        ),
        .testTarget(
            name: "SKArchitekktTests",
            dependencies: ["SKArchitekkt"]
        ),
    ]
)
