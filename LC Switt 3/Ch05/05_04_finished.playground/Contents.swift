
var hello = "Hello, "

let world = "world!"

let greeting = hello + world

hello += "viewer!"

hello

let startIndex = hello.index(hello.startIndex, offsetBy: 7)

let endIndex = hello.index(hello.endIndex, offsetBy: -2)

let viewer = hello[startIndex...endIndex]

hello.replaceSubrange(startIndex...endIndex, with: world)

var apples = ["McIntosh", "Red Delicious"]

apples += ["Granny Smith"]

var mixedApplesAndOranges = apples + ["Navel", "Valencia", "Moro"]

let anAppleAndAnOrange = mixedApplesAndOranges[2..<4]

mixedApplesAndOranges.removeSubrange(2...3)

print(mixedApplesAndOranges)
