// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPLarkController",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SPLarkController",
            targets: ["SPLarkController"])
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SPLarkController",
            dependencies: [],
            path: "Source/SPLarkController"),
        .testTarget(
            name: "SPLarkTests",
            dependencies: [],
            path: "Tests/SPLarkTests")
    ]
)
