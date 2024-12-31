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
           url: "https://github.com/FinioTech/UserVerification-iOS-SDK/releases/download/1.2.3/UserVerification.xcframework.zip",
           checksum: "3df3340d215e8660e481f6b5e2279425e79ca9b7f79e0436fc8bdfdcdc7c075b"
        )
    ],
    swiftLanguageVersions: [.v5]
)
