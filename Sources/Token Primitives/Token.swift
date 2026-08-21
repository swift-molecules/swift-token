public struct Token: Sendable, Equatable, Hashable {

    public let kind: Kind

    public let range: Text.Range

    @inlinable
    public init(kind: Kind, range: Text.Range) {
        self.kind = kind
        self.range = range
    }
}
