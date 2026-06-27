// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
// This gets copied over from the dev repo to the LowCode-IOS staging repo as Package.swift during a release.

import PackageDescription

let package = Package(
    name: "LowCodeMobile",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "LowCodeMobile",
            targets: ["LowCodeMobileSdkWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/salesforce-marketingcloud/Personalization-IOS.git", from: "2.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "LowCodeMobile",
            path: "Frameworks/LowCodeMobile.xcframework"
        ),
        .target(
            name: "LowCodeMobileSdkWrapper",
            dependencies: [
                .target(name: "LowCodeMobile"),
                // Personalization (and its transitive CDP + SFMC deps) pulled in here
                .product(name: "Personalization", package: "Personalization-IOS")
            ],
            path: "LowCodeMobileSdkWrapper"
        )
    ]
)
