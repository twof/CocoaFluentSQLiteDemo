// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Dependencies",
    products: [
        .library(name: "Dependencies", type: .dynamic, targets: ["Dependencies"]),
    ],
    dependencies: [
        .package(url: "https://github.com/twof/fluent-sqlite.git", .exact("0.1.0")),
    ],
    targets: [
        .target(name: "Dependencies", dependencies: ["FluentSQLite"], path: "." )
    ]
)
