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
           url: "https://github.com/FinioTech/UserVerification-iOS-SDK/releases/download/1.2.2/UserVerification.xcframework.zip",
           checksum: "7bf61d7d406fcd9abfb19a18dedb01f95c7a19b17ced5ba2684294b9acacf806"
        )
    ],
    swiftLanguageVersions: [.v5]
)
