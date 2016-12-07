
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

enum Heading : Int {
    
    case north, south, east, west
    
}

let heading = Heading(rawValue: 0)

let invalidHeading = Heading(rawValue: 10)

enum ClockPosition : Double {
    
    case one = 1
    case oneThirty = 1.5
    case two = 2, three, four, five, six, seven, eight, nine, ten, eleven, twelve
    
}

ClockPosition.two.rawValue

enum Proverb : String {
    
    case fortune = "Fortune favors the bold"
    case late = "Better late than never"
    case practice = "Practice makes permanent"
    
    // Type properties
    static var allValues: [Proverb] = [.fortune, .late, .practice]
    
    // Instance properties
    var uppercased: String {
        return rawValue.uppercased()
    }
    
    // Type methods
    static func random() -> Proverb {
        return allValues[Int(arc4random_uniform(UInt32(allValues.count)))]
    }
}

Proverb.fortune.uppercased

Proverb.random().rawValue
