// The Swift Programming Language
// https://docs.swift.org/swift-book

public struct HTMLParser {
    
    public init() {}
    
    public func start(html: String) -> [ElementNode] {
        let tokenizer = Tokenizer(html: html);

        let tokens = tokenizer.tokenize()

        let parser = Parser();
        let nodes = parser.start(tokens: tokens)
        
        return nodes

    }
    
}
