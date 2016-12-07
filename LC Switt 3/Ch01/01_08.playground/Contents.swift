
struct Car {
    let model: String
    
    func drive() {
        print("Vroooom!")
    }
}

struct Driver {
    let cars: [Car]
}

let tesla = Car(model: "S P100D")

let jaguar = Car(model: "XE S")

let icon = Car(model: "FJ44")

let scott = Driver(cars: [tesla, jaguar, icon])


