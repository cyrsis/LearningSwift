
let riders: [(name: String, heightInches: Int)]

riders = [
    ("Charlotte", 46),
    ("Laura", 50),
    ("Minnie", 42)
]

for rider in riders {
    guard rider.heightInches >= 44 else {
        print("\(rider.name) is NOT tall enough")
        continue
    }
    
    print("\(rider.name) is tall enough")
}

func updateSignFor(lifeguardOnDuty: String?) {
    guard let lifeguard = lifeguardOnDuty else {
        print("No lifeguard on duty. Swim at your own risk!")
        return
    }
    
    print("Lifeguard on duty: \(lifeguard)")
}

updateSignFor(lifeguardOnDuty: nil)

updateSignFor(lifeguardOnDuty: "C.J.")
