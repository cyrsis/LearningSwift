
let quote = "In the end, we only regret the chances we didn't take."

var newQuote = quote

newQuote = "In the end, it's not the years in your life that count. It's the life in your years."

print(quote)

let shape = "circle"
let radius = 5.0
let area = Double.pi * radius * radius

print("The area of a \(shape) with a radius of \(radius) is \(area.rounded()).")

quote.characters.count

newQuote.isEmpty

"hello".uppercased()

"STOP YELLING".lowercased()

quote.hasPrefix("In the beginning")

newQuote.hasSuffix("years.")

newQuote.append(" It's the life in your years.")

String(repeating: "🙂", count: 5)

import Foundation

let verse1 = "I like to eat, eat, eat, apples and bananas!"

let verse2 = verse1.replacingOccurrences(of: "eat", with: "ate")
    .replacingOccurrences(of: "ap", with: "ay-")
    .replacingOccurrences(of: "bananas", with: "ba-nay-nays")

print(verse1, verse2, separator: "\n")

/*:
 Escape characters:
 \n - new line (\r works, too)
 \t - tab
 \  - escape \ and "
 \0 - null character
 */

print("\"Whatever you are, be a good one.\"\n\t\t\t-- Abraham Lincoln")

print("A cow says, \"Moo!\"")

"\0".isEmpty
