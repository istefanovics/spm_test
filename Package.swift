// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "spm_test",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        //.library(
        //    name: "spm_test",
        //    targets: ["spm_test"])

        .library(
            name: "spm_test",
            targets: ["TestSDKFrameworkWrapper"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.

        //.target(
        //    name: "spm_test",
        //    dependencies: [
        //        .product(name: "Alamofire", package: "Alamofire")
        //    ],
        //    path: "spm_test"
        //)

        .binaryTarget(name: "spm_test",
                      url: "https://github.com/istefanovics/spm_test/raw/master/xcframework/spm_test.xcframework.zip",
                      checksum: "d8ef435e23f07cf76d6d0def530e00295ff10f058be7fa4b16845966a7cad9f9"),
        .target(
            name: "TestSDKFrameworkWrapper",         // <--- new wrapper
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                .target(name: "spm_test")    // <-- reference the actual binary target here
            ],
            path: "Sources/TestWrapper",
            publicHeadersPath: ""
        ),
    ],
    swiftLanguageVersions: [.v5]
)
