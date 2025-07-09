//
//  Types.swift
//  HTML Parser (CMD)
//
//  Created by Chidume Nnamdi on 02/01/2025.
//

import Foundation

public enum NodeType {
 case Node
 case Text
}

public struct Attributes {
    var name: String;
    var value: String?;
}

public struct Token {
    var id = UUID();
    var index: Int;
    var name: String;
    var startTag: Bool?;
    var endTag: Bool?;
    var attributes: [Attributes]?;
    var type: NodeType;
}

public protocol ElementNode {
    var name: String { get set };
    var id: UUID { get set }
}

public struct Element: ElementNode {
    public var name: String;
    public var children: [ElementNode];
    public var attributes: [Attributes]?;
    public var id = UUID()
}

public struct Text: ElementNode {
    public var name: String;
    public var id = UUID()
}

public enum DOMNodeType: String, CaseIterable {
    case a = "a"
    case abbr = "abbr"
    case address = "address"
    case area = "area"
    case article = "article"
    case aside = "aside"
    case audio = "audio"
    case b = "b"
    case base = "base"
    case bdi = "bdi"
    case bdo = "bdo"
    case blockquote = "blockquote"
    case body = "body"
    case br = "br"
    case button = "button"
    case canvas = "canvas"
    case caption = "caption"
    case cite = "cite"
    case code = "code"
    case col = "col"
    case colgroup = "colgroup"
    case data = "data"
    case datalist = "datalist"
    case dd = "dd"
    case del = "del"
    case details = "details"
    case dfn = "dfn"
    case dialog = "dialog"
    case div = "div"
    case dl = "dl"
    case dt = "dt"
    case em = "em"
    case embed = "embed"
    case fieldset = "fieldset"
    case figcaption = "figcaption"
    case figure = "figure"
    case footer = "footer"
    case form = "form"
    case h1 = "h1"
    case h2 = "h2"
    case h3 = "h3"
    case h4 = "h4"
    case h5 = "h5"
    case h6 = "h6"
    case head = "head"
    case header = "header"
    case hgroup = "hgroup"
    case hr = "hr"
    case html = "html"
    case i = "i"
    case iframe = "iframe"
    case img = "img"
    case input = "input"
    case ins = "ins"
    case kbd = "kbd"
    case label = "label"
    case legend = "legend"
    case li = "li"
    case link = "link"
    case main = "main"
    case map = "map"
    case mark = "mark"
    case meta = "meta"
    case meter = "meter"
    case nav = "nav"
    case noscript = "noscript"
    case object = "object"
    case ol = "ol"
    case optgroup = "optgroup"
    case option = "option"
    case output = "output"
    case p = "p"
    case param = "param"
    case picture = "picture"
    case pre = "pre"
    case progress = "progress"
    case q = "q"
    case rp = "rp"
    case rt = "rt"
    case ruby = "ruby"
    case s = "s"
    case samp = "samp"
    case script = "script"
    case section = "section"
    case select = "select"
    case small = "small"
    case source = "source"
    case span = "span"
    case strong = "strong"
    case style = "style"
    case sub = "sub"
    case summary = "summary"
    case sup = "sup"
    case svg = "svg"
    case table = "table"
    case tbody = "tbody"
    case td = "td"
    case template = "template"
    case textarea = "textarea"
    case tfoot = "tfoot"
    case th = "th"
    case thead = "thead"
    case time = "time"
    case title = "title"
    case tr = "tr"
    case track = "track"
    case u = "u"
    case ul = "ul"
    case varTag = "var" // `var` is a keyword in Swift
    case video = "video"
    case wbr = "wbr"
    case text = "text"
    case unknown = "unknown"
}

