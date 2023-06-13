import UIKit

// 100DaysOfSwift - Day 13 - Swift review, day one

// MARK: Variables & Constants
let author: String = "Konrad Podrygalski"
let day: Int = 13
var isSwiftReviewFinished: Bool = false
var skills: [String] = []

// MARK: String interpolation
print("Hey! I'm \(author). I'm working on day \(day) of 100DaysOfSwift.")

// MARK: Arrays
var mySkills: [String] = ["Basics of Swift", "Basics of SwiftUI", "REST API", "Git"]
skills.append(contentsOf: mySkills)
skills.append("Unit testing")
skills.insert("Communicativeness", at: 2)

let indexOfBasicSwift: Int? = skills.firstIndex(of: "Basics of Swift")

// MARK: Dictionaries
let baseSettings: [String:Bool] = [
    "fullScreenMode": false,
    "isFinished": false,
    "enableDarkColorTheme": true
]

let enableDarkColorTheme = baseSettings["enableDarkColorTheme", default: false]
print("User enabled dark color theme: \(enableDarkColorTheme)")

let runInFullScreenMode = baseSettings["fullScreenMode", default: true]
print("Run app in full screen mode: \(runInFullScreenMode)")

// MARK: Loops
var numbers: [Int] = []

for number in 1...100 {
    numbers.append(number)
}

// Solve FizzBuzz
for number in numbers {
    // MARK: Conditional statements
    if number % 15 == 0 {
        print("\(number) :: FizzBuzz")
    } else if number % 5 == 0 {
        print("\(number) :: Buzz")
    } else if number % 3 == 0 {
        print("\(number) :: Fizz")
    }
}

// MARK: Switch
enum Direction {
    case north, south, west, east
}

let direction: Direction = .north

switch direction {
case .north:
    print("We are moving to North")
case .south:
    print("We are moving to South")
case .west:
    print("We are moving to West")
case .east:
    print("We are moving to East")
}

