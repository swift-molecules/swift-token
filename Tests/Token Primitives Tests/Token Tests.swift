// ===----------------------------------------------------------------------===//
//
// This source file is part of the swift-token-primitives open source project
//
// Copyright (c) 2025 Coen ten Thije Boonkkamp and the swift-token-primitives project authors
// Licensed under Apache License v2.0
//
// See LICENSE for license information
//
// ===----------------------------------------------------------------------===//

import Testing
import Token_Primitives_Test_Support

// MARK: - Token

extension Token {
    @Suite
    struct Test {
        @Suite struct Unit {}
        @Suite struct EdgeCase {}
    }
}

// MARK: - Unit

extension Token.Test.Unit {
    @Test
    func `init stores kind and range`() {
        let range = Text.Range(start: 0, end: 5)
        let token = Token(kind: .keyword(.struct), range: range)
        #expect(token.kind == .keyword(.struct))
        #expect(token.range == range)
    }

    @Test
    func `equal tokens compare equal`() {
        let range = Text.Range(start: 0, end: 6)
        let a = Token(kind: .keyword(.struct), range: range)
        let b = Token(kind: .keyword(.struct), range: range)
        #expect(a == b)
    }

    @Test
    func `tokens with different kind compare not equal`() {
        let range = Text.Range(start: 0, end: 6)
        let a = Token(kind: .keyword(.struct), range: range)
        let b = Token(kind: .keyword(.enum), range: range)
        #expect(a != b)
    }

    @Test
    func `tokens with different range compare not equal`() {
        let a = Token(kind: .keyword(.struct), range: Text.Range(start: 0, end: 6))
        let b = Token(kind: .keyword(.struct), range: Text.Range(start: 7, end: 13))
        #expect(a != b)
    }

    @Test
    func `equal tokens hash to same bucket`() {
        let range = Text.Range(start: 0, end: 6)
        let a = Token(kind: .keyword(.struct), range: range)
        let b = Token(kind: .keyword(.struct), range: range)
        var set: Set<Token> = [a]
        set.insert(b)
        #expect(set.count == 1)
    }
}
