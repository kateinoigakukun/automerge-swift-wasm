// swift-tools-version: 5.8

import PackageDescription
import Foundation

let package = Package(
    name: "Example",
    dependencies: [
        .package(url: "https://github.com/kateinoigakukun/automerge-swift", revision: "3cbe046a296ce8f4674708a8777058c5e4013400"),
    ],
    targets: [
        .executableTarget(
            name: "Example",
            dependencies: [.product(name: "Automerge", package: "automerge-swift")],
            linkerSettings: [
              .unsafeFlags([URL(fileURLWithPath: #filePath).deletingLastPathComponent().appendingPathComponent("libuniffi_automerge.a").path]),
            ]),
    ]
)
