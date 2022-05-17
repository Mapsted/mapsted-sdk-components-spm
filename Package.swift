// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "MapstedComponents",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "MapstedComponentsUI",
            targets: ["MapstedComponentsUIWrapper"]
        ),
        .library(
            name: "MapstedComponentsCore",
            targets: ["MapstedComponentsCore"]
        )
    ],
    dependencies: [
            .package(
                name: "MapstedNotify",
                url: "https://github.com/Mapsted/mapsted-sdk-notify-spm",
                .upToNextMajor(from: "4.6.2")
            ),
            
            .package(
                name: "MapstedCore",
                url: "https://github.com/Mapsted/mapsted-sdk-core-spm",
                .exact("4.6.2")
            )
        
    ],
    targets: [
        .target(name: "MapstedComponentsUIWrapper",
                dependencies: [
                    .target(name: "MapstedComponentsUI"),
                    .product(name: "MapstedCore", package: "MapstedCore"),
                    .product(name: "MapstedAlerts", package: "MapstedNotify")
                ]
        ),
        .binaryTarget(
            name: "MapstedComponentsUI",
            path: "MapstedComponentsUI.xcframework"
        ),
        .binaryTarget(
            name: "MapstedComponentsCore",
            path: "MapstedComponentsCore.xcframework"
        )
    ])


