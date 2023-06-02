import UIKit

// 100 Days of Swift: Day 1

// MARK: Variables
var greeting = "Hello, playground"

var firstName = "Konrad"
var age = 27
var favouriteProgrammingLanguage = "Swift"

print("Hello, My name is \(firstName) and my age is \(age).")
print("My favourite programming language is: \(favouriteProgrammingLanguage)")


// MARK: Strings and Integers
var randomText: String = "This is a simple text."
var veryBigNumber: Int = 1_000_000

print("\(randomText) --- \(veryBigNumber)")


// MARK: Multiline strings
var multilineString = """
This text
is multiple
linse string
"""

var anotherMultilineStrig = """
Some random \
super long long \
multiline string
"""

print(multilineString)
print(anotherMultilineStrig)


// MARK: Double and Boolean
var pi = 3.141
var myDouble: Double = 9.11
var isEnabled: Bool = true

print("PI: \(pi)")
print("myDouble: \(myDouble)")
print("isEnabled: \(isEnabled.description)")


// MARK: String interpolation
var score = 95
var str = "Your score was \(score)."


// MARK: Constants
let taylor: String = "Swift"

print(taylor)


// MARK: Type annotations
let randomStr: String = "Lorem ipsum..."
let album: String = "Rocks"
let releaseYear: Int = 2023
let price: Double = 199.99
let taylorRocks: Bool = true
