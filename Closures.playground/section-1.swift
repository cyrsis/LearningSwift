// Playground - noun: a place where people can play

import UIKit


let names = ["Al", "Ann", "Alex", "Alice", "Audrey"]


// Returns `true` if name < 4 bytes long (in UTF8)
func isShortName(name: String) -> Bool {
    return name.lengthOfBytes(using: String.Encoding.utf8) < 4
}

// Returns a closure that returns `true` if the
// length of the given string is less than `max`.
// This parameter defaults to 3 if not defined
func nameWithMaxLength(max: Int = 3) -> (String) -> Bool {
    return { (name: String) in
        return name.lengthOfBytes(using: String.Encoding.utf8) < max
    }
}

// In-line filtering with a closure
print(names.filter() { $0.lengthOfBytes(using: String.Encoding.utf8) < 3 })

// Filtering with a named function
print(names.filter(isShortName))

// Filtering with a generated function and parameter
print(names.filter(nameWithMaxLength(max: 7)))

// Filtering with a generated function (default value)
print(names.filter(nameWithMaxLength()))
