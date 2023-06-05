import UIKit

// 100DaysOfSwift - Day 7 - Closures, part two

// MARK: Using closures as parameters when they accept parameters
func travel(action: (String) -> ()) {
    print("I'm getting ready to go.")
    action("San Francisco")
    print("Arrived!")
}

travel { place in
    print("I'm going to visit \(place).")
}


// MARK: Using closures as parameters when they return values
func travelInTime(action: (String) -> String) {
    print("We will travel in time...")
    let backToTheFuture = action("Los Angeles")
    print(backToTheFuture)
    print("Done.")
}

travelInTime { (place: String) -> String in
    return "I will visit \(place) in 2099."
}


// MARK: Shorthand parameter names
func printLuckNumber(action: (Int) -> Int) {
    print("Getting lucky number...")
    let luckyNumber = action(96)
    print("Your lucky number is: \(luckyNumber)")
}

printLuckNumber { $0 }


// MARK: Closures with multiple parameters
func getSquare(action: (Int, Int) -> Int) {
    print("Calculating square...")
    let square = action(10, 10)
    print("Square is: \(square)")
}

getSquare { $0 * $1 }


// MARK: Returning closures from functions
func quickTravel() -> (String) -> Void {
    return {
        print("I will visit \($0)")
    }
}

let quickTravelResult = quickTravel()
quickTravelResult("Norway")


// MARK: Capturing values
func counter() -> (String) -> Void {
    var current = 0
    return {
        print("\($0) - Current value is: \(current)")
        current += 1
    }
}

let testResult = counter()

testResult("Test_1")
testResult("Test_2")
testResult("Test_3")


