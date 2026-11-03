# swift-token

Use this package when you need a value for one lexed Swift token: what kind it is and the source range it covers. You can store, compare, hash and classify it without depending on a lexer. Start from `Token`, `Token.Kind` and `Token.Keyword`. To turn source text into tokens, use the sibling swift-lexer package, which produces these values.

## Laws

- `Token.Keyword` raw values follow declaration order, starting at 0. `<` compares raw values, so the order is declaration order too. Inserting or reordering a case changes both.
- Two `Token` values are equal only when both `kind` and `range` are equal. The same keyword at two different ranges gives two different tokens.
- The keyword categories can overlap. A keyword can be in more than one category: `consuming` is both `isOwnership` and `isContextual`. Some keywords are in none of them, for example `self`, `nil`, `as` and `where`.
- `Token.Kind.fixedText` gives the spelling of every kind whose text never varies. It gives `""` for `endOfFile`. It gives `nil` for kinds whose text varies (identifiers, operators, literals, `unknown`) and for `keyword`, whose spelling is `Token.Keyword.text`.
- A kind having fixed text does not make it punctuation. `wildcard` and the `#if`-family kinds have `fixedText` but are not `isPunctuation`. `keyword(.operator)` is not `isOperator`. `stringSegment` and `stringInterpolationStart` count as `isLiteral`.
