import UIKit

// 100 Days of Swift - Day 2 - Complex types

// MARK: Complex types
// Arrays
// Sets
// Tuples
// Dictionaries
// Enums

// MARK: Arrays
let superHeroes = ["Iron Man", "Hulk", "Captain America", "Spider-Man"]
print(superHeroes)

let emptyArray: [String] = []

let todos: Array<String> = ["Learn more Swift", "Practice Swift", "Have fun with Swift"]
print(todos)
print("Todos count: \(todos.count)")
print("Indices: \(todos.indices)")

var numbers = [Int]()

numbers.append(10)
numbers.append(contentsOf: [20, 30, 40])

print(numbers)


// MARK: Sets
// - Items aren’t stored in any order; they are stored in what is effectively a random order.
// - No item can appear twice in a set; all items must be unique.

let programmingLanguages: Set<String> = Set(["Swift", "Objective-C", "Python", "C#", "Go"])
print(programmingLanguages)


var animals = Set<String>()
animals.insert("Dog")
animals.insert("Cat")
animals.insert("Octopus")

print(animals)
print("Animals count: \(animals.count)")
print("Is animals empty?: \(animals.isEmpty.description)")


// MARK: Tuples
// - You can’t add or remove items from a tuple; they are fixed in size.
// - You can’t change the type of items in a tuple; they always have the same types they were created with.
// - You can access items in a tuple using numerical positions or by naming them, but Swift won’t let you read numbers or names that don’t exist.

var name = (first: "Taylor", last: "Swift")
print(name.first)
print(name.1)

// Arrays can hold any number of items, including duplicates, and preserve their order.
// Sets are preferred when you don't want duplicate items and when order doesn't matter.
// Tuples are preferred when you want limited items of specific types and names.


// MARK: Dictionaries
let users: [String:String] = [
    "Konrad": "nsrivss",
    "Elize": "elise101"
]

print(users["Konrad", default: "Unknown"])
print(users["Elize"] ?? "Unknown")


// MARK: Empty collections
var teams = [String:String]() // Dictionary<String, String> key: String, value: String
var results = [Int]() // Array of ints
var randomNumbers = Set<Int>() // Set of ints


// MARK: Enumerations

enum Direction {
    case north, south, east, west
}

let direction: Direction = .north
let anotherDirection = Direction.south
print(direction)


// MARK: Enums - Associated values
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(song: String)
}

let currentActivity: Activity = .running(destination: "Central Park")
print(currentActivity)

let singingActivity = Activity.singing(song: "Blur - Song 2")
print(singingActivity)


// MARK: Enums - Raw Values
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

