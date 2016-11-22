// Playground - Equality and Identity

import UIKit

var dateA = NSDateComponents()
dateA.year = 2000
dateA.month = 01
dateA.day =  01

var dateB = NSDateComponents()
dateB.year = 2000
dateB.month = 01
dateB.day =  01

// check EQUALITY: ==
if dateA == dateB {
    print("Yes, dateA and dateB are equal to each other")
}

// check IDENTITY: ===
if dateA === dateB {
    print("They're identical.")
} else {
    print("They might be equal, but they're not identical.")
}



var dateC = dateA // By Reference

if dateA === dateC {
    print("Yes, dateA and dateC are identical - they refer to the same object.")
}

