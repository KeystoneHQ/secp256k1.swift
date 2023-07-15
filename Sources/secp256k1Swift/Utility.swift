//
//  Utility.swift
//  GigaBitcoin/secp256k1.swift
//
//  Copyright (c) 2022 GigaBitcoin LLC
//  Distributed under the MIT software license
//
//  See the accompanying file LICENSE for information
//

import Foundation
import secp256k1Wrapper

public extension ContiguousBytes {
    @inlinable var bytes: [UInt8] {
        withUnsafeBytes { bytesPtr in Array(bytesPtr) }
    }
}

public extension Data {
    @inlinable var bytes: [UInt8] {
        withUnsafeBytes { bytesPtr in Array(bytesPtr) }
    }

    func copyToUnsafeMutableBytes<T>(of value: inout T) {
        _ = Swift.withUnsafeMutableBytes(of: &value) { ptr in
            ptr.copyBytes(from: self.prefix(ptr.count))
        }
    }
}

extension Int32 {
    var boolValue: Bool {
        Bool(truncating: NSNumber(value: self))
    }
}

public extension secp256k1_ecdsa_signature {
    var dataValue: Data {
        var mutableSig = self
        return Data(bytes: &mutableSig.data, count: MemoryLayout.size(ofValue: data))
    }
}

public extension String {
    /// Public initializer backed by the `BytesUtil.swift` DataProtocol extension property `hexString`
    /// - Parameter bytes: byte array to initialize
    init<T: DataProtocol>(bytes: T) {
        self.init()
        self = bytes.hexString
    }

    /// Public convenience property backed by the `BytesUtil.swift` Array extension initializer
    /// - Throws: `ByteHexEncodingErrors` for invalid string or hex value
    var bytes: [UInt8] {
        get throws {
            // The `BytesUtil.swift` Array extension expects lowercase strings
            try Array(hexString: lowercased())
        }
    }
}

extension Data {
    @inlinable func withUnsafeByteBuffer<ResultType>(_ body: (UnsafeBufferPointer<UInt8>) throws -> ResultType) rethrows -> ResultType {
        try withUnsafeBytes { rawBuf in
            try body(rawBuf.bindMemory(to: UInt8.self))
        }
    }

    @inlinable mutating func withUnsafeMutableByteBuffer<ResultType>(_ body: (UnsafeMutableBufferPointer<UInt8>) throws -> ResultType) rethrows -> ResultType {
        try withUnsafeMutableBytes { rawBuf in
            try body(rawBuf.bindMemory(to: UInt8.self))
        }
    }
}

extension Data {
    init<A>(of a: A) {
        let d = Swift.withUnsafeBytes(of: a) {
            Data($0)
        }
        self = d
    }
}

func toData(utf8: String) -> Data {
    utf8.data(using: .utf8)!
}

extension String {
    var utf8Data: Data {
        toData(utf8: self)
    }
}

func toHex(byte: UInt8) -> String {
    String(format: "%02x", byte)
}

func toHex(data: Data) -> String {
    data.reduce(into: "") {
        $0 += toHex(byte: $1)
    }
}

extension Data {
    var hex: String {
        toHex(data: self)
    }
}

typealias RandomDataFunc = (Int) -> Data

extension RandomNumberGenerator {
    mutating func randomData(_ count: Int) -> Data {
        (0..<count).reduce(into: Data()) { data, _ in
            data.append(UInt8.random(in: 0...255, using: &self))
        }
    }
}
