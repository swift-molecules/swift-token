extension Token {

    public enum Kind: Sendable, Equatable, Hashable {

        case keyword(Token.Keyword)

        case leftBrace

        case rightBrace

        case leftParen

        case rightParen

        case leftBracket

        case rightBracket

        case leftAngle

        case rightAngle

        case colon

        case semicolon

        case comma

        case period

        case arrow

        case atSign

        case pound

        case ampersand

        case equal

        case exclamationMark

        case questionMark

        case backslash

        case ellipsis

        case tilde

        case backtick

        case binaryOperator

        case prefixOperator

        case postfixOperator

        case integerLiteral

        case floatingLiteral

        case stringLiteral

        case stringSegment

        case stringInterpolationStart

        case identifier

        case dollarIdentifier

        case poundIf

        case poundElse

        case poundElseif

        case poundEndif

        case wildcard

        case endOfFile

        case unknown
    }
}
