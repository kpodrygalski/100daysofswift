import UIKit

// 100DaysOfSwift - Day 10 - Classes

// MARK: Creating your own classes
class Animal {
    let name: String
    let age: Int
    let breed: String
    
    init(name: String, age: Int, breed: String) {
        self.name = name
        self.age = age
        self.breed = breed
    }
}

let jiji = Animal(name: "Jiji", age: 2, breed: "Dog")
dump(jiji)

let shiro = Animal(name: "Shiro", age: 5, breed: "Cat")
dump(shiro)


// MARK: Class inheritance
class Dog: Animal {
    init(name: String, breed: String) {
        super.init(name: name, age: Int.random(in: 1...5), breed: breed)
    }
}

let rusty = Dog(name: "Rusty", breed: "Wolf")
dump(rusty)

class BaseShape {
    let sides: Int
    
    init(sides: Int) {
        self.sides = sides
    }
}


class Square: BaseShape {
    let hasColor: Bool
    
    init(hasColor: Bool, sides: Int) {
        self.hasColor = hasColor
        super.init(sides: sides)
    }
}

let squareOne = Square(hasColor: true, sides: 4)
dump(squareOne)


// MARK: Overriding methods
class Vehicle {
    let name: String
    let color: String
    let topSpeed: Int
    
    init(name: String, color: String, topSpeed: Int) {
        self.name = name
        self.color = color
        self.topSpeed = topSpeed
    }
    
    func startEngine() -> String {
        return "..::::^^^\(self.name) - engine started at Vehicle."
    }
}

class Dodge: Vehicle {
    let isMuscleCar: Bool
    
    init(name: String, color: String, topSpeed: Int, isMuscleCar: Bool) {
        self.isMuscleCar = isMuscleCar
        super.init(name: name, color: color, topSpeed: topSpeed)
    }
    
    override func startEngine() -> String {
        return "::::^^^^...\(self.name) - engine started at Muscle car."
    }
}


let chargerRT = Dodge(name: "Dodge", color: "Black", topSpeed: 175, isMuscleCar: true)
print(chargerRT.startEngine())


// MARK: Final classes
final class BaseItem {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}


// Error -> we can't inherit from BaseItem - it's marked as final.
//class SubItem: BaseItem {
//
//}


// MARK: Copying objects
class Singer {
    var name: String = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Bad Wolves"

print("Singer :: \(singer.name)")
print("SingerCopy :: \(singerCopy.name)")


// MARK: Deinitializers
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)!")
    }
    
    deinit {
        print("Person object has been destroyed.")
    }
}

let personOne = Person(name: "Sara")
let personTwo = Person(name: "Ash")

for personNumber in 1...3 {
    let person = Person(name: "NamePerson_\(personNumber)")
    person.printGreeting()
}


// MARK: Mutability
class Task {
    var isDone: Bool // change here to let to prevent changes in line 159
    
    init(isDone: Bool) {
        self.isDone = isDone
    }
}

let task = Task(isDone: false)
task.isDone = true
print(task.isDone.description)
