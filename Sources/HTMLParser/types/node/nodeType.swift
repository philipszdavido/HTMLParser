//
//  File.swift
//  HTMLParser
//
//  Created by Chidume Nnamdi on 09/07/2025.
//

import Foundation

// MARK: - Attribute Map
public typealias AttrMap = [String: String]

// MARK: - DOM Node
public struct Node: Identifiable, Codable {
    public var id = UUID()
    public var children: [Node]
    public var nodeType: NodeType
    
    public init(id: UUID = UUID(), children: [Node], nodeType: NodeType) {
        self.id = id
        self.children = children
        self.nodeType = nodeType
    }

}

// MARK: - Node Type
public enum NodeType : Codable {
    case text(String)
    case element(ElementData)

    enum CodingKeys: CodingKey {
        case type, value
    }

    enum NodeTypeKey: String, Codable {
        case text
        case element
    }

    // Custom Encoding
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .text(let str):
            try container.encode(NodeTypeKey.text, forKey: .type)
            try container.encode(str, forKey: .value)
        case .element(let data):
            try container.encode(NodeTypeKey.element, forKey: .type)
            try container.encode(data, forKey: .value)
        }
    }

    // Custom Decoding
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(NodeTypeKey.self, forKey: .type)

        switch type {
        case .text:
            let str = try container.decode(String.self, forKey: .value)
            self = .text(str)
        case .element:
            let data = try container.decode(ElementData.self, forKey: .value)
            self = .element(data)
        }
    }
    
}

// MARK: - Element Data
public struct ElementData: Codable {
    public var tagName: HTMLTagName
    public var attributes: AttrMap
    
    public init(tagName: HTMLTagName, attributes: AttrMap) {
        self.tagName = tagName
        self.attributes = attributes
    }
}

public enum HTMLTagName: String, Codable {
    case html, head, body, title, meta, link, style, script, noscript
    case header, nav, main, section, article, aside, footer
    case h1, h2, h3, h4, h5, h6, p, span, div, a, img, br, hr
    case ul, ol, li, dl, dt, dd
    case table, thead, tbody, tfoot, tr, th, td
    case form, input, textarea, button, select, option, label
    case iframe, canvas, video, audio, source, track
    case strong, em, b, i, u, small, sub, sup, mark, code, pre, blockquote
    case figure, figcaption, details, summary
    case time, meter, progress
    case unknown
}

extension HTMLTagName {
    public init(rawOrUnknown value: String) {
        self = HTMLTagName(rawValue: value.lowercased()) ?? .unknown
    }
}
