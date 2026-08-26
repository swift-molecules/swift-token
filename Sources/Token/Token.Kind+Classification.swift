extension Token.Kind {

    @inlinable
    public var isKeyword: Bool {
        if case .keyword = self { return true }
        return false
    }

    @inlinable
    public var isPunctuation: Bool {
        switch self {
        case .leftBrace, .rightBrace, .leftParen, .rightParen,
            .leftBracket, .rightBracket, .leftAngle, .rightAngle,
            .colon, .semicolon, .comma, .period, .arrow, .atSign,
            .pound, .ampersand, .equal, .exclamationMark,
            .questionMark, .backslash, .ellipsis, .tilde, .backtick:
            return true

        default:
            return false
        }
    }

    @inlinable
    public var isOperator: Bool {
        switch self {
        case .binaryOperator, .prefixOperator, .postfixOperator:
            return true

        default:
            return false
        }
    }

    @inlinable
    public var isLiteral: Bool {
        switch self {
        case .integerLiteral, .floatingLiteral, .stringLiteral,
            .stringSegment, .stringInterpolationStart:
            return true

        default:
            return false
        }
    }

    @inlinable
    public var isIdentifier: Bool {
        switch self {
        case .identifier, .dollarIdentifier:
            return true

        default:
            return false
        }
    }

    @inlinable
    public var fixedText: Swift.String? {
        switch self {
        case .leftBrace: return "{"
        case .rightBrace: return "}"
        case .leftParen: return "("
        case .rightParen: return ")"
        case .leftBracket: return "["
        case .rightBracket: return "]"
        case .leftAngle: return "<"
        case .rightAngle: return ">"
        case .colon: return ":"
        case .semicolon: return ";"
        case .comma: return ","
        case .period: return "."
        case .arrow: return "->"
        case .atSign: return "@"
        case .pound: return "#"
        case .ampersand: return "&"
        case .equal: return "="
        case .exclamationMark: return "!"
        case .questionMark: return "?"
        case .backslash: return "\\"
        case .ellipsis: return "..."
        case .tilde: return "~"
        case .backtick: return "`"
        case .wildcard: return "_"
        case .poundIf: return "#if"
        case .poundElse: return "#else"
        case .poundElseif: return "#elseif"
        case .poundEndif: return "#endif"
        case .endOfFile: return ""
        default: return nil
        }
    }
}
