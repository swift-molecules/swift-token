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
    /// A Swift keyword.
    ///
    /// Backed by `UInt8` for compact storage (1 byte per keyword). Covers the
    /// Primitives Swift subset (~64 keywords) needed to express the 61+ atomic
    /// packages in swift-primitives.
    ///
    /// Keywords are grouped logically but stored in a flat enum. Classification
    /// is provided by computed properties (``isDeclaration``, ``isStatement``,
    /// etc.) rather than nested enums, following the swift-syntax `Keyword`
    /// pattern.
    ///
    /// Contextual keywords (`consuming`, `borrowing`, `some`, `any`, `get`,
    /// `set`, etc.) do not require backtick escaping in the enum definition
    /// since they are not Swift reserved words.
    public enum Keyword: UInt8, Sendable, Equatable, Hashable {

        // MARK: - Declaration Keywords

        case `struct`
        case `enum`
        case `func`
        case `var`
        case `let`
        case `typealias`
        case `init`
        case `deinit`
        case `subscript`
        case `protocol`
        case `extension`
        case `import`
        case `static`
        case `associatedtype`
        case `operator`
        case `precedencegroup`
        case `case`

        // MARK: - Control Flow Keywords

        case `if`
        case `else`
        case `guard`
        case `switch`
        case `default`
        case `for`
        case `in`
        case `while`
        case `return`
        case `break`
        case `continue`
        case `fallthrough`
        case `defer`

        // MARK: - Error Handling Keywords

        case `throw`
        case `throws`
        case `try`
        case `do`
        case `catch`

        // MARK: - Ownership Keywords

        case consuming
        case borrowing
        case `inout`
        case mutating
        case nonmutating

        // MARK: - Access Control Keywords

        case `public`
        case `internal`
        case `private`
        case `fileprivate`
        case package

        // MARK: - Accessor Keywords

        case get
        case set
        case _read
        case _modify

        // MARK: - Type Keywords

        case some
        case any
        case `self`
        case `Self`
        case `nil`
        case `true`
        case `false`

        // MARK: - Expression Keywords

        case `as`
        case `is`
        case `where`

        // MARK: - Variadic Generics Keywords

        case each
        case `repeat`

        // MARK: - Other Keywords

        case yield
        case discard
        case `indirect`
    }
}

// MARK: - Comparable

extension Token.Keyword: Comparable {
    /// Orders two keywords by their underlying raw value.
    @inlinable
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
