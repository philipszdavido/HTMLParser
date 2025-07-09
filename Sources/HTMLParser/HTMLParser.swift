// The Swift Programming Language
// https://docs.swift.org/swift-book

public struct HTMLParser {
    
    public func start(html: String) {
        
        let tokenizer = Tokenizer(html: html);

        let tokens = tokenizer.tokenize()

        let parser = Parser();
        let nodes = parser.start(tokens: tokens)
        print(nodes)

    }
    
}
