
let rangeA = 0..<10

rangeA.count

let rangeB = 0...10

rangeB.count

var fibonacciNumbers = [1, 3, 6, 10, 15, 21] // Not!

let replacement = [1, 2, 3, 5, 8, 13]

fibonacciNumbers.replaceSubrange(1..<5, with: replacement)

print(fibonacciNumbers)
