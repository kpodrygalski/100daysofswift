import UIKit

// 100DaysOfSwift - Day 11 - Protocols

// MARK: Protocols
protocol Identifiable {
    var id: String { get set } // we can get property from object and set it
}

// User conform to protocol Identifiable
struct User: Identifiable {
    var id: String
}

let user = User(id: UUID().uuidString)
print(user.id)


// MARK: Protocol inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study() -> ()
}

protocol HasVacation {
    func takeVacation(for days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

struct Developer: Employee {
    func calculateWages() -> Int {
        return 1_000 * 12
    }
    
    func study() {
        print("I need more practice on Swift / SwiftUI.")
    }
    
    func takeVacation(for days: Int) {
        let outputText = days == 1 ? "day" : "days"
        print("Taking vacation for: \(days) \(outputText)")
    }
}

let me = Developer()
print("Calculated wage is: \(me.calculateWages())")
me.study()
me.takeVacation(for: 1)


// MARK: Extensions
extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
print("Squared number of \(number) is \(number.squared())")


// MARK: Protocol extensions
protocol Calculator {
    func add(a: Int, b: Int) -> Int
}

extension Calculator {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
}

struct MyCalculator: Calculator {
    func add(a: Int, b: Int) -> Int {
        (a + b) / 2
    }
}

let myTestCalculator = MyCalculator()
let result = myTestCalculator.add(a: 5, b: 10)
print("Result: \(result)")


// MARK: Protocol-oriented programming
protocol Identity {
    var id: String { get set }
    func identify()
}

extension Identity {
    func identify() {
        print("Your ID is: \(id)")
    }
}

struct Person: Identity {
    var id: String = UUID().uuidString
}

let person = Person()
person.identify()
