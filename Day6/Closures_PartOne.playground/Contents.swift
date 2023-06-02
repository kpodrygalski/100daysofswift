import UIKit

// 100DaysOfSwift - Day 6 - Closures, part one

// MARK: Basic closure without parameter
let sendDefaultGreetings = {
    print("Hello, World from my first closure.")
}

let makeTestConnection = {
    print("Testing connection to VPS...")
}

sendDefaultGreetings()
makeTestConnection()


// MARK: Accepting parameters in a closure
let makeCoffee = { (forFriend: String, quantity: Int) in
    print("I'm making \(quantity) coffee for my friend \(forFriend).")
}

let addNumbers = { (numberOne: Int, numberTwo: Int) in
    print("Result :: \(numberOne) + \(numberTwo) = \(numberOne + numberTwo)")
}

makeCoffee("Jack", 1)
addNumbers(5, 25)

// MARK: Returning values from a closure
let getSquare = { (number: Int) -> Int in
    return number * number
}

let numberToSquare = 15
print("Square of \(numberToSquare) is \(getSquare(numberToSquare))")


// MARK: Closures as parameters
let driving = {
    print("I'm driving a car.")
}

func travelToOtherCity(from startPlace: String, to destination: String, action: () -> ()) -> String {
    print("Prepare for travel...")
    action()
    return "I arrived to \(destination)"
}

print(travelToOtherCity(from: "New York", to: "Las Vegas", action: driving))

// MARK: Trailing closure syntax
func travel(action: () -> Void) {
    print("I'm going to drive.")
    action()
    print("Uff... Finally arrived.")
}

travel(action: {
    print("Traveling by car.")
})

travel {
    print("Traveling by bike.")
}

// MARK:

// TODO: Remove it from here. - Testing defer keyword.
func demo(flag: Bool) {
    defer { print("4") }
    
    if flag {
        defer { print("1") }
        print("2")
        print("3")
    }
    
    print("5")
}

demo(flag: true)
