import UIKit

// 100DaysOfSwift - Day 5 - Functions

// MARK: Functions without accepting params
func sayHelloWorld() {
    print("Hello, World!")
}

sayHelloWorld()

func addTwoNumbers() {
    let a = 10
    let b = 20
    print("Sum: \(a+b)")
}

addTwoNumbers()


// MARK: Functions with params
func addNumbersWithParams(a: Int, b: Int) {
    print("Sum: \(a) + \(b) = \(a+b)")
}

addNumbersWithParams(a: 10, b: 15)


// MARK: Returning values
func square(number: Int) -> Int {
    return number * number
}

print("Square of 5 is: \(square(number: 5))")


// MARK: Parameter labels
func travel(from city: String, to anotherCity: String) -> String {
    return "Traveling from \(city) to \(anotherCity)"
}

print(travel(from: "Los Angeles", to: "New York"))


// MARK: Omitting parameter labels
func anotherSayHelloWorldWithParam(_ person: String) -> String {
    return "Hello, World by \(person)!"
}

print(anotherSayHelloWorldWithParam("Jack"))


// MARK: Default parameter
func greetings(_ person: String, from: String = "Avril") -> String {
    return "Sending greetings from \(from) to \(person)"
}

print(greetings("Konrad"))
print(greetings("Jackie", from: "Ann"))


// MARK: Variadic functions
func getTotalNumberSquare(numbers: Int...) -> Int {
    var totalNumberSquare = 0
    for number in numbers {
        totalNumberSquare += number * number
    }
    return totalNumberSquare
}

print("\(getTotalNumberSquare(numbers: 1,2,3))")

func sendGreetings(to persons: String...) {
    for person in persons {
        print("Sending greetings to: \(person)")
    }
}

sendGreetings(to: "Konrad", "Ann", "Jackie")


// MARK: Writing throwing functions
enum PasswordError: Error {
    case tooShort, obvious
}

func validatePassword(_ password: String) throws -> Bool {
    if password == "password" || password == "Qwerty123" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        throw PasswordError.tooShort
    }
    
    return true
}


// MARK: Running throwing functions
do {
    let result = try validatePassword("")
    switch result {
    case true:
        print("Your password is ok.")
    case false:
        print("Your password has some problems")
    }
} catch {
    print("Error: \(error)")
}


// MARK: inout parameters
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNumber = 100
doubleInPlace(number: &myNumber)
print("\(myNumber)")

func paintWalls(tastefully: Bool, color: inout String) {
    if tastefully {
        color = "Red"
    } else {
        color = "Mint"
    }
}

var color = ""
paintWalls(tastefully: true, color: &color)
print(color)

