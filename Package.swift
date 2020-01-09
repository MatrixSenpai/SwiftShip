// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "battleship",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/MatrixSenpai/LibSnowflake", from: "1.0.0"),
        .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.0.0")
    ],
    targets: [
        .target(name: "battleship", dependencies: ["LibSnowflake", "ShellOut"]),
        .testTarget(name: "battleshipTests", dependencies: ["battleship"]),
    ]
)
