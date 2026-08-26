import Testing
import Token_Test_Support

extension Token.Kind {
    @Suite
    struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
    }
}

extension Token.Kind.Test.Unit {
    @Test
    func `keyword equality`() {
        let a: Token.Kind = .keyword(.func)
        let b: Token.Kind = .keyword(.func)
        let c: Token.Kind = .keyword(.var)
        #expect(a == b)
        #expect(a != c)
    }

    @Test
    func `punctuation differs from keyword`() {
        let punct: Token.Kind = .leftBrace
        let kw: Token.Kind = .keyword(.struct)
        #expect(punct != kw)
    }

    @Test
    func `isKeyword identifies keyword cases`() {
        #expect(Token.Kind.keyword(.struct).isKeyword)
        #expect(Token.Kind.keyword(.if).isKeyword)
        #expect(!Token.Kind.leftBrace.isKeyword)
        #expect(!Token.Kind.identifier.isKeyword)
        #expect(!Token.Kind.integerLiteral.isKeyword)
    }

    @Test
    func `isPunctuation identifies punctuation cases`() {
        #expect(Token.Kind.leftBrace.isPunctuation)
        #expect(Token.Kind.rightParen.isPunctuation)
        #expect(Token.Kind.comma.isPunctuation)
        #expect(Token.Kind.arrow.isPunctuation)
        #expect(Token.Kind.tilde.isPunctuation)
        #expect(!Token.Kind.keyword(.struct).isPunctuation)
        #expect(!Token.Kind.binaryOperator.isPunctuation)
        #expect(!Token.Kind.identifier.isPunctuation)
    }

    @Test
    func `isOperator identifies operator cases`() {
        #expect(Token.Kind.binaryOperator.isOperator)
        #expect(Token.Kind.prefixOperator.isOperator)
        #expect(Token.Kind.postfixOperator.isOperator)
        #expect(!Token.Kind.leftBrace.isOperator)
        #expect(!Token.Kind.keyword(.operator).isOperator)
    }

    @Test
    func `isLiteral identifies literal cases`() {
        #expect(Token.Kind.integerLiteral.isLiteral)
        #expect(Token.Kind.floatingLiteral.isLiteral)
        #expect(Token.Kind.stringLiteral.isLiteral)
        #expect(Token.Kind.stringSegment.isLiteral)
        #expect(Token.Kind.stringInterpolationStart.isLiteral)
        #expect(!Token.Kind.identifier.isLiteral)
    }

    @Test
    func `isIdentifier identifies identifier cases`() {
        #expect(Token.Kind.identifier.isIdentifier)
        #expect(Token.Kind.dollarIdentifier.isIdentifier)
        #expect(!Token.Kind.keyword(.self).isIdentifier)
        #expect(!Token.Kind.integerLiteral.isIdentifier)
    }

    @Test
    func `fixedText returns text for punctuation`() {
        #expect(Token.Kind.leftBrace.fixedText == "{")
        #expect(Token.Kind.rightBrace.fixedText == "}")
        #expect(Token.Kind.leftParen.fixedText == "(")
        #expect(Token.Kind.rightParen.fixedText == ")")
        #expect(Token.Kind.leftBracket.fixedText == "[")
        #expect(Token.Kind.rightBracket.fixedText == "]")
        #expect(Token.Kind.leftAngle.fixedText == "<")
        #expect(Token.Kind.rightAngle.fixedText == ">")
        #expect(Token.Kind.colon.fixedText == ":")
        #expect(Token.Kind.semicolon.fixedText == ";")
        #expect(Token.Kind.comma.fixedText == ",")
        #expect(Token.Kind.period.fixedText == ".")
        #expect(Token.Kind.arrow.fixedText == "->")
        #expect(Token.Kind.atSign.fixedText == "@")
        #expect(Token.Kind.pound.fixedText == "#")
        #expect(Token.Kind.ampersand.fixedText == "&")
        #expect(Token.Kind.equal.fixedText == "=")
        #expect(Token.Kind.exclamationMark.fixedText == "!")
        #expect(Token.Kind.questionMark.fixedText == "?")
        #expect(Token.Kind.backslash.fixedText == "\\")
        #expect(Token.Kind.ellipsis.fixedText == "...")
        #expect(Token.Kind.tilde.fixedText == "~")
        #expect(Token.Kind.backtick.fixedText == "`")
        #expect(Token.Kind.wildcard.fixedText == "_")
    }

    @Test
    func `fixedText returns text for conditional compilation`() {
        #expect(Token.Kind.poundIf.fixedText == "#if")
        #expect(Token.Kind.poundElse.fixedText == "#else")
        #expect(Token.Kind.poundElseif.fixedText == "#elseif")
        #expect(Token.Kind.poundEndif.fixedText == "#endif")
    }

    @Test
    func `fixedText returns empty string for endOfFile`() {
        #expect(Token.Kind.endOfFile.fixedText?.isEmpty == true)
    }

    @Test
    func `fixedText returns nil for variable-text kinds`() {
        #expect(Token.Kind.identifier.fixedText == nil)
        #expect(Token.Kind.binaryOperator.fixedText == nil)
        #expect(Token.Kind.integerLiteral.fixedText == nil)
        #expect(Token.Kind.keyword(.struct).fixedText == nil)
        #expect(Token.Kind.unknown.fixedText == nil)
    }
}
