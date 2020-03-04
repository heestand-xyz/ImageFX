// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "ImageFX",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(name: "ImageFX", targets: ["ImageFX"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hexagons/LiveValues.git", from: "1.1.7"),
        .package(url: "https://github.com/hexagons/RenderKit.git", from: "0.3.5"),
        .package(url: "https://github.com/hexagons/PixelKit.git", from: "0.9.9"),
//        .package(path: "~/Code/Frameworks/Production/LiveValues"),
//        .package(path: "~/Code/Frameworks/Production/RenderKit"),
//        .package(path: "~/Code/Frameworks/Production/PixelKit"),
    ],
    targets: [
        .target(name: "ImageFX",
                dependencies: [
                    "LiveValues",
                    "RenderKit",
                    "PixelKit",
                ]),
    ]
)
