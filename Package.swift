// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VerticalSplitView",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "VerticalSplitView",
            targets: ["VerticalSplitView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "VerticalSplitView",
            dependencies: []),
        .testTarget(
            name: "VerticalSplitViewTests",
            dependencies: ["VerticalSplitView"]),
    ]
)
