
import Foundation

var string: String?

struct MyStruct {
    // Properties, initializers, methods, subscripts
}

struct Coordinate3D {
    
    // Instance properties
    var x: Int
    let y: Int
    let z: Int
    var label: String
    
    // Initializers
    init(x: Int, y: Int, z: Int, label: String? = "(unlabeled)") {
        self.x = x
        self.y = y
        self.z = z
        self.label = label!
    }
    
    init(x: Int) {
        self.init(x: x, y: x, z: x)
    }
    
    // Type methods
    static func distanceFrom(coordinate a: Coordinate3D, toCoordinate b: Coordinate3D) -> Int {
        let x = Double(a.x - b.x)
        let y = Double(a.y - b.y)
        let z = Double(a.z - b.z)
        let distance = ((x * x) + (y * y) + (z * z)).squareRoot()
        return Int(distance.rounded())
    }
    
    // Instance methods
    func distanceFrom(coordinate: Coordinate3D) -> Int {
        return Coordinate3D.distanceFrom(coordinate: coordinate, toCoordinate: self)
    }
    
    mutating func moveRight() {
        x += 1
    }
    
    mutating func moveRandom() {
        let r = Int(arc4random_uniform(UInt32.max))
        self = Coordinate3D(x: r, y: r, z: r, label: "(\(r), \(r), \(r))")
    }
}

let origin = Coordinate3D(x: 0, y: 0, z: 0, label: "Origin")

var destination = Coordinate3D(x: 10)

Coordinate3D.distanceFrom(coordinate: origin, toCoordinate: destination)

destination.distanceFrom(coordinate: origin)
