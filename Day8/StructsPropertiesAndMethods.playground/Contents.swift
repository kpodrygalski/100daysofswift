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


// MARK: Initializers
struct Planet {
    var name: String
    var position: Int
    
    init() {
        self.name = "Planet #861927"
        self.position = 0
        print("Created new planet.")
    }
}

var planetOne = Planet()
planetOne.position = 13

dump(planetOne)


// MARK: Referring to the current instance
struct Message {
    let from: String
    let to: String
    let content: String?
    
    init(from: String, to: String, content: String?) {
        self.from = from
        self.to = to
        self.content = content
    }
    
    func printMessage() {
        print("Message from \(from) --> \(to) with content: \(content ?? "Test message")")
    }
}

let message = Message(from: "James", to: "Sara", content: nil)
message.printMessage()
let messageTwo = Message(from: "Sara", to: "James", content: "Huh, is it working?")
messageTwo.printMessage()


// MARK: Lazy properties
struct FamilyTree {
    init() {
        print("Creating family tree.")
    }
}

struct PersonV2 {
    let firstName: String
    let lastName: String
    lazy var familyTree = FamilyTree()
}

var testPerson = PersonV2(firstName: "Jackie", lastName: "Strong")
print(testPerson.familyTree)


// MARK: Static properties and methods
struct Student {
    static var classSize: Int = 0
    let name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
    
    static func getTotalStudentsInClass() {
        print("\(Student.classSize) in class called from static method.")
    }
}


let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")

print("\(Student.classSize) in class")
Student.getTotalStudentsInClass()


// MARK: Access control
struct Book {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func getId() -> String {
        "BookID = \(id)"
    }
}

let book = Book(id: "123")
print("Id of book is: \(book.getId())")

