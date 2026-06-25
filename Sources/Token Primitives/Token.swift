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

/// A classified span of source text.
///
/// A token pairs a lexical classification (``Token/Kind-swift.enum``) with the
/// byte range it occupies in UTF-8 encoded text. The token text itself is not
/// stored — it is derived by slicing the source buffer at ``range``.
///
/// ## Design
///
/// Token is the atomic unit of lexical analysis. The lexer produces tokens;
/// the parser consumes them. All major compiler implementations (swiftc, Clang,
/// rust-analyzer, Roslyn) use this pattern: a lightweight value pairing a kind
/// tag with a source location.
///
/// Token uses ``Text/Range`` (file-agnostic byte range) rather than
/// `Source.Range` (file-qualified). File identity is a compositional concern —
/// the lexer operates on a single file's text, and all tokens from that
/// invocation share the same file identity.
public struct Token: Sendable, Equatable, Hashable {
    /// The lexical classification of this token.
    public let kind: Kind

    /// The byte range of this token within its source text.
    public let range: Text.Range

    /// Creates a token with the given kind and byte range.
    @inlinable
    public init(kind: Kind, range: Text.Range) {
        self.kind = kind
        self.range = range
    }
}
