
class Vehicle {
    
    var passengerCapacity = 4
    let zeroTo60: Float
        
    init(passengers: Int, zeroTo60: Float) {
        passengerCapacity = passengers
        self.zeroTo60 = zeroTo60
    }
}

class ElectricVehicle : Vehicle, CustomStringConvertible {
    
    let rangePerCharge: Int
    
    var description: String {
        return "\(ElectricVehicle.self):\n\tPassengers: \(passengerCapacity)\n\t0 to 60: \(zeroTo60) seconds\n\tRange: \(rangePerCharge) miles"
    }
    
    init(passengers: Int, zeroTo60: Float, rangePerCharge: Int) {
        self.rangePerCharge = rangePerCharge
        super.init(passengers: passengers, zeroTo60: zeroTo60)
    }
}

let teslaModelS = ElectricVehicle(passengers: 4, zeroTo60: 2.5, rangePerCharge: 315)

print(teslaModelS)

struct Coordinate3D : Hashable {
    let x: Int
    let y: Int
    let z: Int
    var label: String
    
    var hashValue: Int {
        return "\(label)-\(x)-\(y)-\(z)".hashValue
    }
    
    init(x: Int, y: Int, z: Int, label: String? = "(unlabeled)") {
        self.x = x
        self.y = y
        self.z = z
        self.label = label!
    }
    
    static func ==(left: Coordinate3D, right: Coordinate3D) -> Bool {
        return (left.x, left.y, left.z, left.label) == (right.x, right.y, right.z, right.label)
    }
}

let origin = Coordinate3D(x: 0, y: 0, z: 0, label: "Origin")

var destination = Coordinate3D(x: 10, y: 10, z: 10, label: "Destination")

let setOfCoordinate3Ds: Set = [origin, destination]

origin == destination
