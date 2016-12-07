
import Foundation

var string: String?

struct MyStruct {
    // Properties, initializers, methods, subscripts
}

struct Coordinate3D {
    
    // Instance properties
    let x: Int
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
}

let origin = Coordinate3D(x: 0, y: 0, z: 0, label: "Origin")

var destination = Coordinate3D(x: 10)
