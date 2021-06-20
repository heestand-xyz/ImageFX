// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "ImageFX",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
    ],
    products: [
        .library(name: "ImageFX", targets: ["ImageFX"]),
    ],
    dependencies: [
        .package(url: "https://github.com/heestand-xyz/PixelKit", .branch("lite")),
        .package(url: "https://github.com/heestand-xyz/RenderKit", .branch("lite")),
        .package(url: "https://github.com/heestand-xyz/PixelColor", from: "1.2.1"),
    ],
    targets: [
        .target(name: "ImageFX", dependencies: ["PixelKit", "PixelColor"]),
    ]
)
