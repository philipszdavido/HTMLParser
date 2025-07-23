
---

### 🧩 HTMLParser

**HTMLParser** is a lightweight HTML parsing engine written entirely in **Swift**. It converts raw HTML strings into a structured tree of tokens and nodes, making it ideal for building custom renderers (like `Browser-SwiftUI`) without relying on WebKit.

#### ✅ Features

* **Tokenization**: Converts raw HTML text into tag and text tokens.
* **Node Tree Construction**: Parses tokens into a structured DOM-like node tree.
* Supports:

  * Opening tags (`<p>`, `<h1>`, etc.)
  * Closing tags (`</p>`)
  * Self-closing tags (`<img />`)
  * Text nodes
  * Nesting and hierarchy
* Designed to be extensible and lightweight.

#### 📄 Example

```swift
let html = """
<h1>Welcome</h1>
<p>This is a <b>bold</b> move.</p>
"""

let tokens = HTMLTokenizer.tokenize(html)
let nodes = HTMLParser.parse(tokens)

for node in nodes {
    print(node.description)
}
```

#### 🧠 Sample Node Output

```
TagNode(tag: "h1", children: [TextNode("Welcome")])
TagNode(tag: "p", children: [
    TextNode("This is a "),
    TagNode(tag: "b", children: [TextNode("bold")]),
    TextNode(" move.")
])
```

#### 🧱 Components

* `HTMLTokenizer`: Breaks input into tokens (start tag, end tag, text, self-closing).
* `HTMLNode`: Represents elements like tags and text.
* `HTMLParser`: Builds a tree of `HTMLNode`s from tokens using a stack-based approach.
