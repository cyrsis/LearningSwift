
do {
    defer {
        print("Lift off!")
    }
    
    for i in (1...3).reversed() {
        print(i)
    }
}

do {
    defer {
        print("Action!")
    }
    
    defer {
        print("Camera")
    }
    
    defer {
        print("Lights")
    }
    
    print("All quiet on set")
}

func doSomething(passing: Bool) {
    defer {
        print("Prints no matter what!")
    }
    
    guard passing else {
        print("Guard failed")
        return
    }
    
    print("Guard passed")
}

doSomething(passing: false)
