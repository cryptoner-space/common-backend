// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonCryptoner",
    platforms: [
       .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CommonCryptoner",
            targets: ["CommonCryptoner"]),
    ],
    dependencies: [
        .package(url: "https://skibinalexander_@bitbucket.org/ws-sk/common-backend.git", branch: "master"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "CommonCryptoner",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "CommonVapor", package: "common-backend"),
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver")
            ]
        )
    ]
)
