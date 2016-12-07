
import Foundation

let testScore = arc4random_uniform(50) + 51

if testScore >= 70 {
    print("You passed!")
}

if testScore >= 70 {
    if testScore < 76 {
        print("C")
    } else if testScore < 80 {
        print("C+")
    } else if testScore < 86 {
        print("B")
    } else if testScore < 90 {
        print("B+")
    } else if testScore < 96 {
        print("A")
    } else {
        print("A+")
    }
} else {
    print("Study more and try again")
}

if #available(iOS 10, macOS 10.12, watchOS 3.0, *) {
    // Use applicable API from iOS 10, macOS 10.12, and watchOS 3.0
} else {
    // Use earlier API
}
