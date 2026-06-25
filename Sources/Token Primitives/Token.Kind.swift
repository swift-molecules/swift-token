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

extension Token {
    /// The lexical classification of a token.
    ///
    /// A hybrid enum following the swift-syntax pattern: keywords are collapsed
    /// into a single `keyword(_:)` case wrapping ``Token/Keyword``, while
    /// punctuation, operators, literals, identifiers, and special tokens are
    /// individual flat cases.
    ///
    /// Token text for variable-content kinds (operators, identifiers, literals)
    /// is derived from the token's source range, not stored in the kind.
    public enum Kind: Sendable, Equatable, Hashable {

        // MARK: - Keywords

        /// A Swift keyword. See ``Token/Keyword`` for the full enumeration.
        case keyword(Token.Keyword)

        // MARK: - Punctuation

        /// `{`
        case leftBrace
        /// `}`
        case rightBrace
        /// `(`
        case leftParen
        /// `)`
        case rightParen
        /// `[`
        case leftBracket
        /// `]`
        case rightBracket
        /// `<` as a generic parameter list delimiter.
        ///
        /// Ambiguous with the less-than operator. The lexer disambiguates based
        /// on context (spacing rules), following swiftc and swift-syntax
        /// convention.
        case leftAngle
        /// `>` as a generic parameter list delimiter.
        case rightAngle
        /// `:`
        case colon
        /// `;`
        case semicolon
        /// `,`
        case comma
        /// `.`
        case period
        /// `->`
        case arrow
        /// `@`
        case atSign
        /// `#` (when not part of a conditional compilation directive)
        case pound
        /// `&` (inout marker or protocol composition)
        case ampersand
        /// `=` (assignment, not overloadable)
        case equal
        /// `!` (force unwrap, force try)
        case exclamationMark
        /// `?` (optional type, optional chaining, ternary)
        case questionMark
        /// `\` (key path, string interpolation prefix)
        case backslash
        /// `...` (variadic, closed range)
        case ellipsis
        /// `~` (inverse constraint: `~Copyable`, `~Escapable`)
        case tilde
        /// `` ` `` (escaped identifier delimiter)
        case backtick

        // MARK: - Operators

        /// A binary operator (`+`, `-`, `==`, `!=`, `<<`, `??`, etc.).
        ///
        /// The specific operator text is derived from the token's source range.
        case binaryOperator
        /// A prefix operator (prefix `!`, prefix `-`, etc.).
        case prefixOperator
        /// A postfix operator.
        case postfixOperator

        // MARK: - Literals

        /// An integer literal (decimal, `0x` hex, `0b` binary, `0o` octal).
        case integerLiteral
        /// A floating-point literal (decimal float, hex float, exponents).
        case floatingLiteral
        /// A string literal delimiter or complete simple string.
        case stringLiteral
        /// A text segment within an interpolated string literal.
        case stringSegment
        /// `\(` — the start of a string interpolation expression.
        case stringInterpolationStart

        // MARK: - Identifiers

        /// A user identifier or contextual keyword in identifier position.
        case identifier
        /// A closure shorthand argument (`$0`, `$1`, etc.).
        case dollarIdentifier

        // MARK: - Conditional Compilation

        /// `#if`
        case poundIf
        /// `#else`
        case poundElse
        /// `#elseif`
        case poundElseif
        /// `#endif`
        case poundEndif

        // MARK: - Special

        /// `_` — the wildcard/discard pattern.
        ///
        /// Treated as a separate token kind rather than an identifier, following
        /// swift-syntax convention. Structurally distinct from identifiers in
        /// Swift's grammar (discard pattern, anonymous argument label).
        case wildcard
        /// End of file sentinel.
        case endOfFile
        /// An unrecognized character (error recovery).
        case unknown
    }
}
