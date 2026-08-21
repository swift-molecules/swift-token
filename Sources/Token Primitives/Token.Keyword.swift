extension Token {

    public enum Keyword: UInt8, Sendable, Equatable, Hashable {

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

        case `throw`
        case `throws`
        case `try`
        case `do`
        case `catch`

        case consuming
        case borrowing
        case `inout`
        case mutating
        case nonmutating

        case `public`
        case `internal`
        case `private`
        case `fileprivate`
        case package

        case get
        case set
        case _read
        case _modify

        case some
        case any
        case `self`
        case `Self`
        case `nil`
        case `true`
        case `false`

        case `as`
        case `is`
        case `where`

        case each
        case `repeat`

        case yield
        case discard
        case `indirect`
    }
}

extension Token.Keyword: Comparable {

    @inlinable
    public static func < (lhs: Self, rhs: Self) -> Bool {

        lhs.rawValue < rhs.rawValue
    }
}
