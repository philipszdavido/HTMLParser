//
//  File.swift
//  HTMLParser
//
//  Created by Chidume Nnamdi on 09/07/2025.
//

import Foundation
import HTMLParser


    var thisHtml = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Valid HTML Document</title>
    </head>
    <body>
      <h1>Welcome to a Valid HTML Page</h1>
      <p>This is a paragraph of text. Every HTML parser can parse this document.</p>

      <ul>
        <li>List Item 1</li>
        <li>List Item 2</li>
        <li>List Item 3</li>
      </ul>

      <a href="https://example.com" target="_blank">Visit Example.com</a>

      <form action="/submit" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <button type="submit">Submit</button>
      </form>
    </body>
    </html>
    """;

    HTMLParser().start(html: thisHtml)
    print("jgvjhgjgh")

