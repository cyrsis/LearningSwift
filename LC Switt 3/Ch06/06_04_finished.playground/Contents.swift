
var firstName: String? = "Betty"

var lastName: String? = "Gardner"

if let firstName = firstName {
    print("Hello, \(firstName)")
} else {
    print("Welcome, guest!")
}

if let firstName = firstName, var lastName = lastName {
    lastName = lastName.uppercased()
    print("Hello, my name is \(firstName) \(lastName)")
}
