// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModulesKit",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "ModulesKit",
            targets: ["ModulesKit"]),
        .library(
            name: "ModulesKitSnapshot",
            targets: ["ModulesKitSnapshot"]),
    ],
    dependencies: [
        .package(name: "CombinationGenerator", url: "https://github.com/cosmicfools/CombinationGenerator", from: "0.2.3"),
    ],
    targets: [
        .target(
            name: "ModulesKit",
            dependencies: []),
        .target(
            name: "ModulesKitSnapshot",
            dependencies: ["CombinationGenerator"]),
        .testTarget(
            name: "ModulesKitTests",
            dependencies: ["ModulesKit"]),
        .testTarget(
            name: "ModulesKitSnapshotTests",
            dependencies: ["ModulesKit", "ModulesKitSnapshot"]),
    ]
)
