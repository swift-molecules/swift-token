import Testing
import Token_Primitives_Test_Support

extension Token.Keyword {
    @Suite
    struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
    }
}

extension Token.Keyword.Test.Unit {

    @Test
    func `rawValue is backed by UInt8`() {
        #expect(Token.Keyword.struct.rawValue == 0)
        #expect(Token.Keyword.enum.rawValue == 1)
        #expect(Token.Keyword.func.rawValue == 2)
    }

    @Test
    func `round-trip via rawValue preserves identity`() {
        (UInt8(0)..<UInt8(64)).forEach { rawValue in
            if let keyword = Token.Keyword(rawValue: rawValue) {

                #expect(keyword.rawValue == rawValue)
            }
        }
    }

    @Test
    func `comparable follows declaration order`() {
        #expect(Token.Keyword.struct < Token.Keyword.enum)
        #expect(Token.Keyword.enum < Token.Keyword.func)
        #expect(!(Token.Keyword.func < Token.Keyword.struct))
    }

    @Test
    func `equal keywords compare equal`() {
        #expect(Token.Keyword.struct == Token.Keyword.struct)
        #expect(Token.Keyword.struct != Token.Keyword.enum)
    }

    @Test
    func `equal keywords hash to same bucket`() {
        var set: Set<Token.Keyword> = [.struct, .struct, .enum]
        #expect(set.count == 2)
        set.insert(.func)
        #expect(set.count == 3)
    }

    @Test
    func `text for declaration keywords`() {
        #expect(Token.Keyword.struct.text == "struct")
        #expect(Token.Keyword.enum.text == "enum")
        #expect(Token.Keyword.func.text == "func")
        #expect(Token.Keyword.var.text == "var")
        #expect(Token.Keyword.let.text == "let")
        #expect(Token.Keyword.typealias.text == "typealias")
        #expect(Token.Keyword.`init`.text == "init")
        #expect(Token.Keyword.deinit.text == "deinit")
        #expect(Token.Keyword.subscript.text == "subscript")
        #expect(Token.Keyword.protocol.text == "protocol")
        #expect(Token.Keyword.extension.text == "extension")
        #expect(Token.Keyword.import.text == "import")
        #expect(Token.Keyword.static.text == "static")
        #expect(Token.Keyword.associatedtype.text == "associatedtype")
        #expect(Token.Keyword.operator.text == "operator")
        #expect(Token.Keyword.precedencegroup.text == "precedencegroup")
        #expect(Token.Keyword.case.text == "case")
    }

    @Test
    func `text for ownership keywords`() {
        #expect(Token.Keyword.consuming.text == "consuming")
        #expect(Token.Keyword.borrowing.text == "borrowing")
        #expect(Token.Keyword.inout.text == "inout")
        #expect(Token.Keyword.mutating.text == "mutating")
        #expect(Token.Keyword.nonmutating.text == "nonmutating")
    }

    @Test
    func `text for accessor keywords`() {
        #expect(Token.Keyword.get.text == "get")
        #expect(Token.Keyword.set.text == "set")
        #expect(Token.Keyword._read.text == "_read")
        #expect(Token.Keyword._modify.text == "_modify")
    }

    @Test
    func `text for type keywords`() {
        #expect(Token.Keyword.some.text == "some")
        #expect(Token.Keyword.any.text == "any")
        let selfKw: Token.Keyword = .`self`
        #expect(selfKw.text == "self")
        let selfTypeKw: Token.Keyword = .`Self`
        #expect(selfTypeKw.text == "Self")
        let nilKw: Token.Keyword = .`nil`
        #expect(nilKw.text == "nil")
        let trueKw: Token.Keyword = .`true`
        #expect(trueKw.text == "true")
        let falseKw: Token.Keyword = .`false`
        #expect(falseKw.text == "false")
    }

    @Test
    func `isDeclaration identifies declaration keywords`() {
        #expect(Token.Keyword.struct.isDeclaration)
        #expect(Token.Keyword.enum.isDeclaration)
        #expect(Token.Keyword.func.isDeclaration)
        #expect(Token.Keyword.protocol.isDeclaration)
        #expect(Token.Keyword.extension.isDeclaration)
        #expect(Token.Keyword.case.isDeclaration)
        #expect(!Token.Keyword.if.isDeclaration)
        #expect(!Token.Keyword.consuming.isDeclaration)
    }

    @Test
    func `isStatement identifies statement keywords`() {
        #expect(Token.Keyword.if.isStatement)
        #expect(Token.Keyword.else.isStatement)
        #expect(Token.Keyword.guard.isStatement)
        #expect(Token.Keyword.for.isStatement)
        #expect(Token.Keyword.return.isStatement)
        #expect(Token.Keyword.defer.isStatement)
        #expect(!Token.Keyword.struct.isStatement)
        #expect(!Token.Keyword.throw.isStatement)
    }

    @Test
    func `isErrorHandling identifies error handling keywords`() {
        #expect(Token.Keyword.throw.isErrorHandling)
        #expect(Token.Keyword.throws.isErrorHandling)
        #expect(Token.Keyword.try.isErrorHandling)
        #expect(Token.Keyword.do.isErrorHandling)
        #expect(Token.Keyword.catch.isErrorHandling)
        #expect(!Token.Keyword.if.isErrorHandling)
    }

    @Test
    func `isOwnership identifies ownership keywords`() {
        #expect(Token.Keyword.consuming.isOwnership)
        #expect(Token.Keyword.borrowing.isOwnership)
        #expect(Token.Keyword.inout.isOwnership)
        #expect(Token.Keyword.mutating.isOwnership)
        #expect(Token.Keyword.nonmutating.isOwnership)
        #expect(!Token.Keyword.public.isOwnership)
    }

    @Test
    func `isAccessControl identifies access control keywords`() {
        #expect(Token.Keyword.public.isAccessControl)
        #expect(Token.Keyword.internal.isAccessControl)
        #expect(Token.Keyword.private.isAccessControl)
        #expect(Token.Keyword.fileprivate.isAccessControl)
        #expect(Token.Keyword.package.isAccessControl)
        #expect(!Token.Keyword.static.isAccessControl)
    }

    @Test
    func `isAccessor identifies accessor keywords`() {
        #expect(Token.Keyword.get.isAccessor)
        #expect(Token.Keyword.set.isAccessor)
        #expect(Token.Keyword._read.isAccessor)
        #expect(Token.Keyword._modify.isAccessor)
        #expect(!Token.Keyword.func.isAccessor)
    }

    @Test
    func `isContextual identifies contextual keywords`() {
        #expect(Token.Keyword.consuming.isContextual)
        #expect(Token.Keyword.borrowing.isContextual)
        #expect(Token.Keyword.some.isContextual)
        #expect(Token.Keyword.any.isContextual)
        #expect(Token.Keyword.get.isContextual)
        #expect(Token.Keyword.set.isContextual)
        #expect(Token.Keyword.each.isContextual)
        #expect(Token.Keyword.yield.isContextual)
        #expect(Token.Keyword.discard.isContextual)
        #expect(!Token.Keyword.struct.isContextual)
        #expect(!Token.Keyword.if.isContextual)
        #expect(!Token.Keyword.public.isContextual)
    }
}

extension Token.Keyword.Test.`Edge Case` {
    @Test
    func `invalid rawValue returns nil`() {
        #expect(Token.Keyword(rawValue: 255) == nil)
    }
}
