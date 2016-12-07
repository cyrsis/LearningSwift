
import UIKit

class MyClass {
    // Properties, initializers, deinitializers, methods, subscripts
}

class Vehicle {
    
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
        Vehicle.count += 1
    }
    
    convenience init(zeroTo60: Float) {
        self.init(passengers: 4, zeroTo60: zeroTo60)
    }
    
    convenience init() {
        self.init(zeroTo60: 6.0)
    }
    
    // Deinitializer
    deinit {
        Vehicle.count -= 1
    }
    
    // Type methods
    static func printCount() {
        print("Count:", count)
    }
    
    // Instance methods
    func start() {
        fatalError("Override in subclass")
    }

}

class ElectricVehicle : Vehicle {
    
    let rangePerCharge: Int
    
    init(passengers: Int, zeroTo60: Float, rangePerCharge: Int) {
        self.rangePerCharge = rangePerCharge
        super.init(passengers: passengers, zeroTo60: zeroTo60)
    }
    
    convenience init() {
        self.init(passengers: 4, zeroTo60: 6.0, rangePerCharge: 215)
    }
    
    override func start() {
        print("(silence)")
    }
    
}

class MotorVehicle : Vehicle {
    let fuelEfficiency: Int
    
    init(passengers: Int, zeroTo60: Float, fuelEfficiency: Int) {
        self.fuelEfficiency = fuelEfficiency
        super.init(passengers: passengers, zeroTo60: zeroTo60)
    }
}

let teslaModelS = ElectricVehicle(passengers: 4, zeroTo60: 2.5, rangePerCharge: 315)

var teslaModel3: ElectricVehicle? = ElectricVehicle()

teslaModel3 = nil

ElectricVehicle.count

let p100d = teslaModelS

p100d.color = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)

teslaModelS.color

teslaModelS.start()

ElectricVehicle.printCount()

let bugattiVeyron = MotorVehicle(passengers: 2, zeroTo60: 2.5, fuelEfficiency: 7)
