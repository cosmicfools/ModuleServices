// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModulesKit",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ModulesKit",
            targets: ["ModulesKit"]),
        .library(
            name: "ModulesKitSnapshot",
            targets: ["ModulesKitSnapshot"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "CombinationGenerator", url: "https://github.com/cosmicfools/CombinationGenerator", .branch("master"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
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
