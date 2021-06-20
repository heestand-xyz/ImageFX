// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "ImageFX",
    platforms: [
        .iOS("15.0"),
        .tvOS("15.0"),
        .macOS("12.0"),
    ],
    products: [
        .library(name: "ImageFX", targets: ["ImageFX"]),
    ],
    dependencies: [
        .package(url: "https://github.com/heestand-xyz/PixelKit", from: "2.0.3"),
        .package(url: "https://github.com/heestand-xyz/PixelColor", from: "1.2.1"),
    ],
    targets: [
        .target(name: "ImageFX", dependencies: ["PixelKit", "PixelColor"]),
    ]
)
