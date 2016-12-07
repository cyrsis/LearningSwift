//: `/`, `=`, `-`, `+`, `!`, `*`, `%`, `<`, `>`, `&`, `|`, `^`, `?`, `~`, or certain Unicode characters

infix operator <==> : ComparisonPrecedence
prefix operator ++
postfix operator ++
prefix operator --
postfix operator --

precedencegroup ExponentPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: left // 2 * 3 / 4 == (2 * 3) / 4
}

infix operator ** : ExponentPrecedence

infix operator -><- : DefaultPrecedence

import UIKit

func <==>(lhs: CGPoint, rhs: CGPoint) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}

let pointA = CGPoint(x: 5, y: 5)

let pointB = CGPoint(x: 5, y: 10)

pointA <==> pointB

func **(base: Int, exponent: Int) -> Int {
    var exp = exponent
    var result = 1
    
    while (exp != 0) {
        result *= base
        exp -= 1
    }
    
    return result
}

2**8
