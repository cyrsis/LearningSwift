// Playground - noun: a place where people can play

import UIKit

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func say(phrase: String) {
        print("\(firstName) \(lastName) says '\(phrase)'")
    }
    
    class func say(phrase: String) {
        print("…and the people all say '\(phrase)'")
    }
}

let p1 = Person(firstName: "Alex", lastName: "Vollmer")
p1.say(phrase: "let’s write some Swift!")

Person.say(phrase: "let’s get tacos")
