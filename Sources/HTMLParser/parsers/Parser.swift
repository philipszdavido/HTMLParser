//
//  File.swift
//  HTMLParser
//
//  Created by Chidume Nnamdi on 09/07/2025.
//

import Foundation

class Parser {
    
    func start(tokens: [Token]) -> [Node] {
        
        var rootNodes: [Node] = [];
        var index = 0;
        
        while index < tokens.count {
            
            let token = tokens[index];
            
            if (token.self.type == .Text) {
                rootNodes += [Node(children: [], nodeType: .text(token.name))]
            }
            
            if (token.self.type == .Node && !token.self.name.starts(with: "/")) {
                
                let nextTokens = index + 1 >= tokens.count - 1 ? [] : Array(tokens[index + 1...tokens.count - 1])
                
                let uuid = findClosingTag(
                    nextTokens,
                    nodeName: token.self.name
                );
                
                var childrenTokens: [Token] = []
                var closingIndex: Int = index
                
                if let uuid = uuid {
                    
                    closingIndex = tokens.lastIndex { Token in
                        Token.id == uuid
                    }!
                    
                    childrenTokens = Array(tokens[index + 1..<closingIndex])
                    
                }
                
                let children = self.start(
                    tokens: childrenTokens
                );
                
                var attributes: [String : String] = [:]
                for attribute in token.self.attributes! {
                    attributes[attribute.name] = attribute.value
                }
                
                let element = Node(
                    children: children,
                    nodeType: .element(
                        ElementData(
                            tagName: HTMLTagName(rawOrUnknown: token.self.name),
                            attributes: attributes
                        )
                    )
                )
                
                rootNodes += [element];
                                
                index = closingIndex + 1;
                
                continue;
            }
            
            index += 1

        }
                
        return rootNodes
        
    }
    
    func findClosingTag(_ tokens: [Token], nodeName: String) -> UUID? {

        func wherePredicate(token: Token) -> Bool {
            return token.name == "/" + nodeName
        }
        
        let closingToken = tokens.first(where: wherePredicate);
        
        if closingToken == nil {
            
            if SELF_CLOSING_LINKS.contains(nodeName) {
                return nil
            }
                
            return nil
        }
        
        
        guard let closingToken = closingToken else {
            return nil
        };
        
        return closingToken.id

    }
    
}
