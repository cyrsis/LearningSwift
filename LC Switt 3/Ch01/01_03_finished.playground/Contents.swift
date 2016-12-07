//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var hello = "Hello,"; var playground = "playground"

for i in 0..<64 {
    var point = sin(Double(i) * 100)
}

print(str)

NSLog(str)

print(hello, playground)

print(hello, playground, separator: "_", terminator: "")

print("...")

print("\(hello) viewer!")

print("1 + 1 = \(1 + 1)")

func printLiteralExpressions() {
    print("Function: \(#function)")
    print("File: \(#file)")
    print("Line: \(#line)")
    print("Column: \(#column)")
}

printLiteralExpressions()
