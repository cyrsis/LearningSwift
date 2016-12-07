
import Foundation

while arc4random_uniform(100) + 1 < 100 {
    print(".", terminator: "")
}

print()

repeat {
    print(".", terminator: "")
} while arc4random_uniform(100) + 1 < 100
