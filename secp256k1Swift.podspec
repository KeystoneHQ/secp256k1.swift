Pod::Spec.new do |s|
  s.name             = 'secp256k1Swift'
  s.version          = '0.7.4'
  s.summary          = 'elliptic curve public key cryptography, ECDSA, Schnorr Signatures for Bitcoin and C bindings from libsecp256k1.'

  s.homepage         = 'https://github.com/portto/secp256k1.swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'csjones' => '' }
  s.source           = {
    :git => 'https://github.com/portto/secp256k1.swift.git',
    :tag => s.version.to_s,
    :submodules => true
  }
  s.social_media_url = 'https://twitter.com/BloctoApp'
  s.swift_version = '5.0'
  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '6.0'

  s.source_files =
    'Sources/secp256k1Swift/Asymmetric.swift',
    'Sources/secp256k1Swift/DH.swift',
    'Sources/secp256k1Swift/Digests.swift',
    'Sources/secp256k1Swift/ECDH.swift',
    'Sources/secp256k1Swift/ECDSA.swift',
    'Sources/secp256k1Swift/EdDSA.swift',
    'Sources/secp256k1Swift/Errors.swift',
    'Sources/secp256k1Swift/LibSecP256K1.swift',
    'Sources/secp256k1Swift/PrettyBytes.swift',
    'Sources/secp256k1Swift/SafeCompare.swift',
    'Sources/secp256k1Swift/Schnorr.swift',
    'Sources/secp256k1Swift/secp256k1.swift',
    'Sources/secp256k1Swift/SHA256.swift',
    'Sources/swift-crypto/Sources/Crypto/Digests/Digest.swift',
    'Sources/swift-crypto/Sources/Crypto/Signatures/Signature.swift',
    'Sources/swift-crypto/Sources/Crypto/Util/BoringSSL/RNG_boring.swift',
    'Sources/swift-crypto/Sources/Crypto/Util/SecureBytes.swift',
    'Sources/swift-crypto/Tests/_CryptoExtrasTests/Utils/BytesUtil.swift',
    'Sources/secp256k1Swift/Tweak.swift',
    'Sources/secp256k1Swift/Utility.swift',
    'Sources/secp256k1Swift/Zeroization.swift'
  s.dependency 'secp256k1Wrapper', '~> 0.0.5'
  s.dependency 'CryptoSwift', '~> 1.7.2'

end

