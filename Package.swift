// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "MyLibraryAboutCats",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "MyLibraryAboutCats",
            targets: ["MyLibraryAboutCats"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MyLibraryAboutCats",
            dependencies: []
        ),
        .testTarget(
            name: "MyLibraryAboutCatsTests",
            dependencies: ["MyLibraryAboutCats"]
        ),
    ]
)
