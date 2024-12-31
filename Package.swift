// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "UserVerification",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "UserVerification",
            targets: ["UserVerification"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", .upToNextMajor(from: "1.1.2300"))
    ],
    targets: [
        .binaryTarget(
           name: "UserVerification",
           url: "https://github.com/FinioTech/UserVerification-iOS-SDK/releases/download/1.2.1.1/UserVerification.xcframework.zip",
           checksum: "4d695c0192ad50c60f549fef4de47fdf8629aae7b71c668ed66121e5ce6496c0"
        )
    ],
    swiftLanguageVersions: [.v5]
)
