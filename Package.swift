// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonBackend",
    platforms: [
       .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CommonBackend",
            targets: ["CommonBackend"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.84.6"),
        .package(url: "https://github.com/vapor/jwt.git", from: "4.2.2"),
    ],
    targets: [
        .target(
            name: "CommonBackend",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "JWT", package: "jwt"),
            ]
        )
    ]
)
