// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FTMTableSectionModules",
    products: [
        .library(
            name: "FTMTableSectionModules",
            targets: ["FTMTableSectionModules"]),
    ],
    dependencies: [
        .package(name: "CombinationGenerator", url: "https://github.com/CRoig/CombinationGenerator", .branch("feature/spm-support"))
    ],
    targets: [
        .target(name: "FTMTableSectionModules", path: "FTMTableSectionMOdules/Classes/Core"),
        .testTarget(name: "FTMTableSectionModulesTests", dependencies: ["FTMTableSectionModules","CombinationGenerator"], path: "FTMTableSectionMOdules/Classes/Test")
    ]
)
