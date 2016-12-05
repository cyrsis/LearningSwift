// Playground - Lazy Properties
import UIKit

func getDailyBonus() -> Int {
    print("Performing complicated task....")
    return random()
}

class Player {
    
    // properties
    var name : String = "John Doe"
    var score = 0
    lazy var bonus = getDailyBonus()
    
    // methods
    func description() -> String {
        return("Player \(name) has a score of \(score)")
    }
}

var newPlayer = Player()
print(newPlayer.bonus)
