
import UIKit

class MyClass {
    // Properties, initializers, deinitializers, methods, subscripts
}

class ElectricVehicle {
    
    // Type properties
    static var count = 0
    
    // Instance properties
    var passengerCapacity = 4
    let zeroTo60: Float
    var color: UIColor
    
    // Initializers
    init(passengers: Int, zeroTo60: Float, color: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) {
        passengerCapacity = passengers
        self.zeroTo60 = zeroTo60
        self.color = color
        ElectricVehicle.count += 1
    }
    
    convenience init(zeroTo60: Float) {
        self.init(passengers: 4, zeroTo60: zeroTo60)
    }
    
    convenience init() {
        self.init(zeroTo60: 6.0)
    }
    
    // Deinitializer
    deinit {
        ElectricVehicle.count -= 1
    }
}

let teslaModelS = ElectricVehicle(passengers: 4, zeroTo60: 2.5)

var teslaModel3: ElectricVehicle? = ElectricVehicle()

teslaModel3 = nil

ElectricVehicle.count

let p100d = teslaModelS

p100d.color = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)

teslaModelS.color
