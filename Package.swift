// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "UserVerification",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "UserVerification",
            targets: ["UserVerification"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", .upToNextMajor(from: "1.1.2200"))
    ],
    targets: [
        .binaryTarget(
           name: "UserVerification",
           url: "https://github.com/FinioTech/UserVerification-iOS-SDK/releases/download/1.2.0/UserVerification.xcframework.zip",
           checksum: "88a6825a08e15f09eef4e88341d81e5c64630625a0551b50000ec245436426c8"
        )
    ],
    swiftLanguageVersions: [.v5]
)
