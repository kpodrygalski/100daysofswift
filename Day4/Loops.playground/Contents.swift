import UIKit

// 100DaysOfSwift - Day 4


// MARK: For loop
// The most common loop in Swift is a for loop: it will loop over arrays and ranges, and each time the loop goes around it will pull out one item and assign to a constant.
let count = 1...10

for number in count {
    print("Number is \(number)")
}


// MARK: While loop
// A second way of writing loops is using while: give it a condition to check, and its loop code will go around and around until the condition fails.
var number = 1

while number <= 20 {
    print(number)
    number += 1
}


// MARK: Repeat loop
// The third way of writing loops is not commonly used, but it’s so simple to learn we might as well cover it: it’s called the repeat loop, and it’s identical to a while loop except the condition to check comes at the end.
repeat {
    print(number)
    number += 1
} while number <= 20


// MARK: Exiting loops
// To exit the loop we use break keyword

var countDown = 10

while countDown >= 0 {
    print(countDown)
    
    if countDown == 4 {
        print("Break")
        break
    }
    
    countDown -= 1
}


// MARK: Skipping items
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}

