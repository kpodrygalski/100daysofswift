import UIKit

// 100DaysOfSwift - Day 3

// MARK: Arithmetic operators
let firstScore = 10
let secondScore = 20

let sum = firstScore + secondScore
let sub = firstScore - secondScore
let multiplication = firstScore * secondScore
let divide = firstScore / secondScore
let reminder = 18 % 4

print("Sum: \(sum)")
print("Sub: \(sub)")
print("Multiplication: \(multiplication)")
print("Divide: \(divide)")
print("Reminder (%): \(reminder)")


// MARK: Operator overloading
// (+) operator can add not only two numbers, but can also join strings together or arrays

let textOne = "A long long time..."
let textTwo = "in the galaxy..."
let finalText = textOne + " " + textTwo
print(finalText)

let objectsOne = ["ball", "backpack"]
let objectsTwo = ["pencil", "pen"]
let objects = objectsOne + objectsTwo
print(objects)


// MARK: Compound assignment operators
var number = 10

number -= 1
number += 2
number *= 3
print(number)


// MARK: Comparison operators
let valueOne = 6
let valueTwo = 4

valueOne == valueTwo
valueOne != valueTwo

valueOne < valueTwo
valueOne >= valueTwo

let a = 1
let b = 2
let c = 3


// MARK: Condition
let cardOne = 11
let secondCard = 10

if cardOne + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}


let teaStrength = 5
if teaStrength >= 4 {
    print("Success")
} else {
    print("Failure")
}


// MARK: Combining conditions
// && - AND
// || - OR

let ageOne = 12
let ageTwo = 21

if ageOne > 18 && ageTwo > 18 {
    print("Both are over 18.")
}

let average1 = 5.0
let average2 = 4.0

if average1 > 5.0 && average2 > 4.0 {
    print("Hello, Swift!")
}

let name1 = "Charlotte"
let name2 = "Sophie"

if name1 == "Paul" || name2 == "Sophie" {
    print("Hello, Swift!")
}


// MARK: The ternary operator
var retweets = 100
print(retweets > 10 ? "Success" : "Failure")

var averagePages: Double = 10.01
print(averagePages == 10 ? "Success" : "Failure")

let storageSpace = 500
print(storageSpace > 1000 ? "Success" : "Failure")

let isRecyclable = false
print(isRecyclable == true ? "Success" : "Failure")

let isComplete: Bool = false
print(isComplete == true ? "Failure" : "Success")

let strongMagnets = true
print(strongMagnets ? "Success" : "Failure")

let sides = 5
print(sides <= 6 ? "Success" : "Failure")

// MARK: Switch statements
// Swift will only run the code inside each case. If you want execution to continue on to the next case, use the fallthrough keyword
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day")
}


// MARK: Range operator
// ..< - don't include last value
// ... - includes last value

let someCoins = 85

switch someCoins {
case 0..<50:
    print("Not enough coins.")
case 51..<80:
    print("You still missing some coins.")
case 81...100:
    print("You are ready to go.")
default:
    print("More then some coins.")
}

