
let httpStatus200 = (200, "OK")

var numbers: (Int, Float, Double) = (1, 2.3, 4.5)

numbers.2

var httpStatus: (Int, String?)?

var playerScores: ([Int], firstName: String, lastName: String?)

playerScores = ([134_000, 128_500, 156_250], "Scott", "Gardner")

playerScores.firstName

playerScores.2

var (scores, firstName, lastName) = playerScores

firstName = "Eric"

playerScores.firstName

let (scottsScores, _, _) = playerScores

var scottsScore = (100, name: (first: "Scott", last: "Gardner"))

scottsScore.name.first = "Eric"

(10, 20, 30) == (100/10, 100/5, 100 - 70)

let ericsScore = (100, name: (first: "Eric", last: "Gardner"))

//ericsScore == scottsScore
