
import Foundation

public func simulatedErrorDidOccur() -> Bool {
    return arc4random_uniform(2) == 1
}

let errorA = simulatedErrorDidOccur()
let errorB = simulatedErrorDidOccur()

enum E : Error {
    case a
    case b(function: String, line: Int)
}

func performAction() throws {
    defer {
        let count = (errorA ? 1 : 0) + (errorB ? 1 : 0)
        print("Action completed with \(count) " + (count == 1 ? "error" : "errors"))
    }
    
    guard errorA == false else {
        throw E.a
    }
    
    guard errorB == false else {
        throw E.b(function: #function, line: #line)
    }
    
    print("Action completed successfully!")
}

do {
    try performAction()
    print("No error occurred")
} catch E.a {
    print("Error A encountered")
} catch let E.b(function, line) where line < 200 {
    print("Error encountered in \(function) on line \(line)")
} catch {
    print("Maybe you should refactor?")
}

func doSomething() {
    do {
        try performAction()
    } catch {
        print("Oh no!")
    }
}

doSomething()

func doSomethingElse() throws {
    try performAction()
}

do {
    try doSomethingElse()
} catch {
    print("Oh no, again!")
}

func performActionThatMightFail() throws -> String {
    return "Success!"
}

let maybeSuccess = try? performActionThatMightFail()

let definitelySuccess = try! performActionThatMightFail()

func executeThrowingFunction(_ function: () throws -> Void) rethrows {
    return try function()
}

do {
    try executeThrowingFunction(performAction)
} catch {
    print(error)
}
