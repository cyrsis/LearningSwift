
import Foundation

let testScore = arc4random_uniform(50) + 51

switch testScore {
case 100:
    print("💯")
case 0...69:
    print("Study more and try again")
case 70...74:
    print("C")
case 75...79:
    print("C+")
case 80...84:
    print("B")
case 85...89:
    print("B+")
case 90...94:
    print("A")
default:
    print("A+")
}

let die1 = arc4random_uniform(6) + 1

let die2 = arc4random_uniform(6) + 1

switch (die1, die2) {
case (1, 1):
    fallthrough
case (6, 6):
    print("30 points")
case (1...2, 1...2):
    print("16 points")
case _ where die1 + die2 == 7:
    print("5 points")
case let (thrown, _) where die1 == die2:
    
    switch thrown * 2 {
    case 4, 10:
        print("8 points")
    default:
        print("10 point")
    }
default:
    break
}
