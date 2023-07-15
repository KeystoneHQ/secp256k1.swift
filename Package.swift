// swift-tools-version:5.6

import PackageDescription

var dependencies: [Package.Dependency] = [
    .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.7.2"),
    .package(url: "https://github.com/portto/secp256k1.git", from: "0.0.5")
]

#if os(macOS)
    dependencies.append(contentsOf: [
        // Dependencies used for package development
        .package(url: "https://github.com/csjones/lefthook.git", branch: "swift"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.49.5"),
        .package(url: "https://github.com/realm/SwiftLint.git", from: "0.46.5"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
    ])
#endif

let package = Package(
    name: "secp256k1Swift",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "secp256k1Swift",
            targets: [
                "secp256k1Swift"
            ]
        )
    ],
    dependencies: dependencies,
    targets: [
        .target(
            name: "secp256k1Swift",
            dependencies: [
                "CryptoSwift",
                .product(name: "secp256k1Wrapper", package: "secp256k1")
            ],
            path: "Sources",
            exclude: [
                "swift-crypto/cmake",
                "swift-crypto/CMakeLists.txt",
                "swift-crypto/CODE_OF_CONDUCT.md",
                "swift-crypto/CONTRIBUTING.md",
                "swift-crypto/CONTRIBUTORS.md",
                "swift-crypto/dev/git.commit.template",
                "swift-crypto/docker",
                "swift-crypto/LICENSE.txt",
                "swift-crypto/NOTICE.txt",
                "swift-crypto/Package.swift",
                "swift-crypto/README.md",
                "swift-crypto/scripts",
                "swift-crypto/SECURITY.md",
                "swift-crypto/Sources/_CryptoExtras",
                "swift-crypto/Sources/CCryptoBoringSSL",
                "swift-crypto/Sources/CCryptoBoringSSLShims",
                "swift-crypto/Sources/CMakeLists.txt",
                "swift-crypto/Sources/crypto-shasum",
                "swift-crypto/Sources/Crypto/AEADs",
                "swift-crypto/Sources/Crypto/ASN1",
                "swift-crypto/Sources/Crypto/CMakeLists.txt",
                "swift-crypto/Sources/Crypto/CryptoKitErrors.swift",
                "swift-crypto/Sources/Crypto/Digests/BoringSSL/Digest_boring.swift",
                "swift-crypto/Sources/Crypto/Digests/Digests.swift",
                "swift-crypto/Sources/Crypto/Digests/Digests.swift.gyb",
                "swift-crypto/Sources/Crypto/Digests/HashFunctions_SHA2.swift",
                "swift-crypto/Sources/Crypto/Digests/HashFunctions.swift",
                "swift-crypto/Sources/Crypto/Insecure",
                "swift-crypto/Sources/Crypto/Key Agreement",
                "swift-crypto/Sources/Crypto/Key Derivation",
                "swift-crypto/Sources/Crypto/Key Wrapping",
                "swift-crypto/Sources/Crypto/Keys",
                "swift-crypto/Sources/Crypto/Message Authentication Codes",
                "swift-crypto/Sources/Crypto/PRF",
                "swift-crypto/Sources/Crypto/Signatures/BoringSSL",
                "swift-crypto/Sources/Crypto/Signatures/ECDSA.swift",
                "swift-crypto/Sources/Crypto/Signatures/ECDSA.swift.gyb",
                "swift-crypto/Sources/Crypto/Signatures/EdDSA.swift",
                "swift-crypto/Sources/Crypto/Util/BoringSSL/ArbitraryPrecisionInteger_boring.swift",
                "swift-crypto/Sources/Crypto/Util/BoringSSL/CryptoKitErrors_boring.swift",
                "swift-crypto/Sources/Crypto/Util/BoringSSL/FiniteFieldArithmeticContext_boring.swift",
                "swift-crypto/Sources/Crypto/Util/BoringSSL/SafeCompare_boring.swift",
                "swift-crypto/Sources/Crypto/Util/BoringSSL/Zeroization_boring.swift",
                "swift-crypto/Sources/Crypto/Util/PrettyBytes.swift",
                "swift-crypto/Sources/Crypto/Util/SafeCompare.swift",
                "swift-crypto/Sources/Crypto/Util/Zeroization.swift",
                "swift-crypto/Tests/_CryptoExtrasTests/TestRSASigning.swift",
                "swift-crypto/Tests/_CryptoExtrasTests/Utils/Wycheproof.swift",
                "swift-crypto/Tests/_CryptoExtrasVectors",
                "swift-crypto/Tests/CryptoTests",
                "swift-crypto/Tests/LinuxMain.swift",
                "swift-crypto/Tests/Test Vectors"
            ],
            sources: [
                "secp256k1Swift/Asymmetric.swift",
                "secp256k1Swift/DH.swift",
                "secp256k1Swift/Digests.swift",
                "secp256k1Swift/ECDH.swift",
                "secp256k1Swift/ECDSA.swift",
                "secp256k1Swift/EdDSA.swift",
                "secp256k1Swift/Errors.swift",
                "secp256k1Swift/LibSecP256K1.swift",
                "secp256k1Swift/PrettyBytes.swift",
                "secp256k1Swift/SafeCompare.swift",
                "secp256k1Swift/Schnorr.swift",
                "secp256k1Swift/secp256k1.swift",
                "secp256k1Swift/SHA256.swift",
                "swift-crypto/Sources/Crypto/Digests/Digest.swift",
                "swift-crypto/Sources/Crypto/Signatures/Signature.swift",
                "swift-crypto/Sources/Crypto/Util/BoringSSL/RNG_boring.swift",
                "swift-crypto/Sources/Crypto/Util/SecureBytes.swift",
                "swift-crypto/Tests/_CryptoExtrasTests/Utils/BytesUtil.swift",
                "secp256k1Swift/Tweak.swift",
                "secp256k1Swift/Utility.swift",
                "secp256k1Swift/Zeroization.swift"
            ]
        ),
        .testTarget(
            name: "secp256k1Tests",
            dependencies: [
                "secp256k1Swift"
            ]
        )
    ],
    swiftLanguageVersions: [.v5],
    cLanguageStandard: .c89
)
