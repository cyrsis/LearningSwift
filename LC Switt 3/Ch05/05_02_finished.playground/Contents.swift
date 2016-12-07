
let a = 4
let b = 2
var c = a // Passed by copy
let d = 4

a == c

c = 5

a

a != b

a > b
b < a

a >= d
a <= d

a > b && b > c

var maybeInt: Int?

var definitelyInt: Int? = 2

//maybeInt > definitelyInt

var e = true

e == !e

func ==(lhs: SomeClass, rhs: SomeClass) -> Bool {
    return lhs.title == rhs.title
}

class SomeClass {
    var title = "SomeClass"
}

let x = SomeClass()
let y = SomeClass()
let z = x // Passed by reference

x == y
x == z

x === y

x === z

x !== y

z.title = "New title"

y.title = "New title"

x == y

x === y

x === z

x == y || x === y
