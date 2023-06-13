import UIKit

// 100DaysOfSwift - Day 8 - Structs, properties and methods

// MARK: Creating your own structs
struct Developer {
    let firstName: String
    let lastName: String
    let favouriteLanguage: String
}

let swiftDeveloper = Developer(firstName: "Konrad", lastName: "Podrygalski", favouriteLanguage: "Swift")
print("\(swiftDeveloper.firstName) \(swiftDeveloper.lastName) :: \(swiftDeveloper.favouriteLanguage)")

struct Item {
    let name: String
    let price: Double
    let isAvailable: Bool
}

let itemOne = Item(name: "Ball", price: 15.99, isAvailable: true)
dump(itemOne)


// MARK: Computed properties
struct Device {
    let name: String
    let model: String
    let price: Double
    
    var summary: String {
        switch model {
        case "AB01":
            return "Very nice and handy model."
        case "AB02":
            return "Unfriendly design."
        default:
            return "Unknown model."
        }
    }
}

let testDevice = Device(name: "RandomDevice", model: "AB01", price: 199.99)
print(testDevice.summary)


// MARK: Property observers
struct Progress {
    let task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete.")
        }
    }
}

var progress = Progress(task: "T_1231aa", amount: 0)
progress.amount = 25
progress.amount = 50
progress.amount = 75
progress.amount = 100


// MARK: Methods
struct Car {
    let name: String
    let basePrice: Double
    let isPremium: Bool

    func addMoreFeatures() -> Double {
        return basePrice * 1250.50
    }
}

let carOne = Car(name: "Volvo", basePrice: 90_000_00, isPremium: true)
print(carOne.addMoreFeatures())


// MARK: Mutating func
struct Animal {
    var name: String
    let age: Int
    
    mutating func hideName() {
        name = "#####"
    }
}

var cat = Animal(name: "Jiji", age: 2)
print(cat.name)
cat.hideName()
print(cat.name)


// MARK: Properties and methods of strings
let testText = "Some random text which is just fine."
print(testText.count)
print(testText.hasPrefix("Is"))
print(testText.uppercased())
print(testText.lowercased())


// MARK: Properties and methods of arrays
var items: [String] = ["Ball", "Backpack", "Pen", "Bottle", "Rubber"]

print(items.count)

items.append("Apple")
let indexOfApple = items.firstIndex(of: "Apple")

items.remove(at: 2)
print(items)