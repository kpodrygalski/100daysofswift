import UIKit

// 100DaysOfSwift - Day 9 - Access control, static properties, and laziness

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
    static var studentsInClass: Int = 0
    static let classNumber: String = "15A"
    let name: String
    
    init(name: String) {
        self.name = name
        Student.studentsInClass += 1
    }
    
    static func getTotalStudentsInClass() {
        print("Class: \(Student.classNumber) :: \(Student.studentsInClass) in class called from static method.")
    }
}

let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")

print("\(Student.studentsInClass) in class")
print("Class number: \(Student.classNumber)")
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


