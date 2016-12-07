
import Foundation

enum Direction {
    
    case up
    case down
    case left
    case right
    
}

var direction = Direction.up

direction = .down

let left: Direction = .left

func moveIn(direction: Direction) {
    print("Moved \(direction)")
}

moveIn(direction: .right)

enum Heading {
    
    case north, south, east, west
    
}
