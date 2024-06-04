// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "ImageFX",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "ImageFX",
            targets: ["ImageFX"]
        ),
    ],
    dependencies: [
        .package(
            url: "http://github.com/heestand-xyz/AsyncGraphics",
            from: "2.0.5"
        ),
        .package(
            url: "https://github.com/heestand-xyz/PixelColor",
            from: "2.2.2"
        ),
    ],
    targets: [
        .target(
            name: "ImageFX",
            dependencies: [
                "AsyncGraphics",
                "PixelColor",
            ]
        ),
    ]
)
