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
           url: "https://github.com/FinioTech/UserVerification-iOS-SDK/releases/download/1.2.1/UserVerification.xcframework.zip",
           checksum: "c2d0a898c7fb8695d3d5d700ec92f0f46ba56265e64315eb0da3b2b9aeca6ec4"
        )
    ],
    swiftLanguageVersions: [.v5]
)
