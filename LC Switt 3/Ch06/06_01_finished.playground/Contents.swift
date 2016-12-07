
let numbers = [1, 2, 3]

for i in numbers {
    print(i)
}

for var i in numbers {
    i *= 2
    print(i)
}

let letters: Set = ["a", "b", "c"]

for l in letters {
    print(l)
}

let scores = ["Scott": 80, "Lori": 90, "Charlotte": 100]

for (player, score) in scores {
    print(player, "scored", score)
}

for l in "SWIFT".characters.enumerated() {
    print(l.0, l.1)
}

for _ in 1...3 {
    print(".")
}

for i in 2...10 where i % 2 == 0 {
    print(i)
}

for i in stride(from: 2, to: 10, by: 2) {
    print(i)
}

for i in stride(from: 2, through: 10, by: 2) {
    print(i)
}

for i in 1 ..< 4 {
    print(i)
}
