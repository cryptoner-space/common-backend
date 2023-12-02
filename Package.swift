// swift-tools-version: 5.9
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
        .package(url: "https://skibinalexander_@bitbucket.org/ws-sk/common-cryptoner-data.git", branch: "master"),
        .package(url: "https://skibinalexander_@bitbucket.org/ws-sk/common-backend.git", branch: "master"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.84.6"),
        .package(url: "https://github.com/vapor/jwt.git", from: "4.2.2"),
    ],
    targets: [
        .target(
            name: "CommonCryptoner",
            dependencies: [
                .product(name: "CommonCryptonerData", package: "common-cryptoner-data"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "JWT", package: "jwt"),
                .product(name: "CommonVapor", package: "common-backend"),
            ]
        )
    ]
)
