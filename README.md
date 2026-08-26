# Token

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Lexical token value types for Swift — a `Token` pairing a lexical classification with the byte range it occupies, plus the `Token.Kind` and `Token.Keyword` enumerations that name every lexeme in the Swift grammar.

---

## Quick Start

A `Token` is the atomic unit of lexical analysis: a kind tag and a source range. It does *not* store the token text — that is recovered by slicing the source buffer at the token's `range`, so a token stays one byte-range wide no matter how long the lexeme is. This is the same shape every major compiler uses (swiftc, Clang, rust-analyzer, Roslyn).

```swift
import Token

// The lexer emits a token: a kind plus the bytes it spans.
let token = Token(kind: .keyword(.func), range: Text.Range(start: 0, end: 4))

// Classify without re-reading the source.
token.kind.isKeyword        // true
token.kind.isOperator       // false

if case .keyword(let keyword) = token.kind {
    keyword.text             // "func"
    keyword.isDeclaration    // true
    keyword.isContextual     // false
}
```

`Token.Kind` is a hybrid enum following the swift-syntax pattern: keywords collapse into a single `keyword(_:)` case wrapping `Token.Keyword`, while punctuation, operators, literals, identifiers, and special tokens are individual flat cases. Fixed-text kinds report their spelling directly; variable-text kinds report `nil` because their text lives in the source.

```swift
import Token

Token.Kind.arrow.fixedText          // "->"
Token.Kind.leftBrace.fixedText      // "{"
Token.Kind.identifier.fixedText     // nil — text depends on the source range
Token.Kind.binaryOperator.fixedText // nil — same

// Group kinds by lexical category.
Token.Kind.colon.isPunctuation      // true
Token.Kind.stringLiteral.isLiteral  // true
```

`Token.Keyword` is backed by `UInt8` for one-byte storage and `Comparable` by raw value. Classification is expressed as computed properties — `isDeclaration`, `isStatement`, `isErrorHandling`, `isOwnership`, `isAccessControl`, `isAccessor`, `isContextual` — rather than nested enums, so a keyword can belong to a category and still answer `isContextual` independently.

```swift
import Token

Token.Keyword.struct.isDeclaration    // true
Token.Keyword.guard.isStatement       // true
Token.Keyword.throws.isErrorHandling  // true
Token.Keyword.consuming.isOwnership   // true
Token.Keyword.consuming.isContextual  // true — not a reserved word
Token.Keyword.public.isAccessControl  // true
```

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-molecules/swift-token.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Token", package: "swift-token"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Two library products. Re-exports `Text` for the `Text.Range` byte range that anchors every token.

| Product | Target | Purpose |
|---------|--------|---------|
| `Token` | `Sources/Token/` | The `Token` struct (`kind` + `range`); the `Token.Kind` enum with `isKeyword` / `isPunctuation` / `isOperator` / `isLiteral` / `isIdentifier` / `fixedText`; and the `Token.Keyword` enum (`UInt8`-backed, `Comparable`) with `text` and the `isDeclaration` / `isStatement` / `isErrorHandling` / `isOwnership` / `isAccessControl` / `isAccessor` / `isContextual` classifiers. |
| `Token Test Support` | `Tests/Support/` | Re-exports the main target for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
