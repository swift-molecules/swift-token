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

// MARK: - Classification

extension Token.Keyword {
    /// Whether this keyword introduces a declaration.
    @inlinable
    public var isDeclaration: Bool {
        switch self {
        case .struct, .enum, .func, .var, .let, .typealias, .`init`, .deinit,
            .subscript, .protocol, .extension, .import, .static,
            .associatedtype, .operator, .precedencegroup, .case:
            return true

        default:
            return false
        }
    }

    /// Whether this keyword introduces or continues a control flow statement.
    @inlinable
    public var isStatement: Bool {
        switch self {
        case .if, .else, .guard, .switch, .default, .for, .in, .while,
            .return, .break, .continue, .fallthrough, .defer:
            return true

        default:
            return false
        }
    }

    /// Whether this keyword is used in error handling.
    @inlinable
    public var isErrorHandling: Bool {
        switch self {
        case .throw, .throws, .try, .do, .catch:
            return true

        default:
            return false
        }
    }

    /// Whether this keyword relates to ownership or mutation.
    @inlinable
    public var isOwnership: Bool {
        switch self {
        case .consuming, .borrowing, .inout, .mutating, .nonmutating:
            return true

        default:
            return false
        }
    }

    /// Whether this keyword specifies access control.
    @inlinable
    public var isAccessControl: Bool {
        switch self {
        case .public, .internal, .private, .fileprivate, .package:
            return true

        default:
            return false
        }
    }

    /// Whether this keyword is a property accessor specifier.
    @inlinable
    public var isAccessor: Bool {
        switch self {
        case .get, .set, ._read, ._modify:
            return true

        default:
            return false
        }
    }

    /// Whether this keyword is contextual (not reserved; can appear as an
    /// identifier in other positions).
    @inlinable
    public var isContextual: Bool {
        switch self {
        case .consuming, .borrowing, .mutating, .nonmutating,
            .package, .get, .set, ._read, ._modify,
            .some, .any, .each, .yield, .discard:
            return true

        default:
            return false
        }
    }

    /// The canonical text of this keyword.
    @inlinable
    public var text: Swift.String {
        switch self {
        case .struct: return "struct"
        case .enum: return "enum"
        case .func: return "func"
        case .var: return "var"
        case .let: return "let"
        case .typealias: return "typealias"
        case .`init`: return "init"
        case .deinit: return "deinit"
        case .subscript: return "subscript"
        case .protocol: return "protocol"
        case .extension: return "extension"
        case .import: return "import"
        case .static: return "static"
        case .associatedtype: return "associatedtype"
        case .operator: return "operator"
        case .precedencegroup: return "precedencegroup"
        case .case: return "case"
        case .if: return "if"
        case .else: return "else"
        case .guard: return "guard"
        case .switch: return "switch"
        case .default: return "default"
        case .for: return "for"
        case .in: return "in"
        case .while: return "while"
        case .return: return "return"
        case .break: return "break"
        case .continue: return "continue"
        case .fallthrough: return "fallthrough"
        case .defer: return "defer"
        case .throw: return "throw"
        case .throws: return "throws"
        case .try: return "try"
        case .do: return "do"
        case .catch: return "catch"
        case .consuming: return "consuming"
        case .borrowing: return "borrowing"
        case .inout: return "inout"
        case .mutating: return "mutating"
        case .nonmutating: return "nonmutating"
        case .public: return "public"
        case .internal: return "internal"
        case .private: return "private"
        case .fileprivate: return "fileprivate"
        case .package: return "package"
        case .get: return "get"
        case .set: return "set"
        case ._read: return "_read"
        case ._modify: return "_modify"
        case .some: return "some"
        case .any: return "any"
        case .self: return "self"
        case .Self: return "Self"
        case .nil: return "nil"
        case .true: return "true"
        case .false: return "false"
        case .as: return "as"
        case .is: return "is"
        case .where: return "where"
        case .each: return "each"
        case .repeat: return "repeat"
        case .yield: return "yield"
        case .discard: return "discard"
        case .indirect: return "indirect"
        }
    }
}
