
func sayHelloWorld() {
    print("Hello, world!")
}

func sayHelloTo(name: String) {
    print("Hello, \(name)!")
}

func say(_ greeting: String, to name: String) {
    print("\(greeting), \(name)!")
}

say("Goodbye", to: "Hollywood")

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

add(4, 6)

func add(_ ints: Int...) -> Int {
    return ints.reduce(0, +)
}

add(2, 4, 6, 8, 10)

print("This", "is", "cool", separator: " ", terminator: "!")

var studentsScore = 76.0

func apply(extraCredit: Double, toScore score: inout Double) {
    score += extraCredit
}

apply(extraCredit: 10.0, toScore: &studentsScore)


