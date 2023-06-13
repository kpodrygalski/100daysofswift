import UIKit

// 100DaysOfSwift - Day 12 - Optionals

// MARK: Handling missing data
var magicNumber: Int? = nil
var mailbox: String? = nil

magicNumber = Int.random(in: 1...100)
mailbox = "test@example.com"
// MARK: Unwrapping optionals
if let unwrappedMagicNumber = magicNumber {
    print("Magic number is: \(unwrappedMagicNumber)")
} else {
    print("There is no magic number :(")
}

if let unwrappedMailbox = mailbox {
    print("Send email here: \(unwrappedMailbox)")
} else {
    print("Mailbox is nil.")
}

// Shorter version
if let magicNumber {
    print("Magic number is: \(magicNumber)")
} else {
    print("There is no magic number :(")
}

if let mailbox {
    print("Send email here: \(mailbox)")
} else {
    print("Mailbox is nil.")
}


// MARK: Unwrapping with guard
func sendGreetings(to personName: String?) {
    guard let unwrappedPersonName = personName else {
        print("personName = nil")
        return
    }
    
    print("Hello, nice to meet you \(unwrappedPersonName).")
}

sendGreetings(to: "Amber")


// MARK: Force unwrapping
let str = "5"
let num = Int(str)!


// MARK: Implicitly unwrapped optionals
// This behave as already unwrapped so we don't need to use if let / guard let to get optionals value
// However - if value is nil app will crash
let address: String! = nil


// MARK: Nil coalescing
func checkProduct(by id: Int?) -> String? {
    guard let id else {
        return "The ID is nil."
    }
    
    if id == 1996 {
        return "iPhone 4S"
    } else if id == 1999 {
        return "MacBook Air 8GB 256GB SSD"
    }
    
    return nil
}

print(checkProduct(by: 15) ?? "Unknown product with given ID.")


// MARK: Optional chaining
let playlist: [String] = ["Insomnium", "Wolfheart", "Katatonia", "Amon Amarth", "Linkin Park"]
let firstArtist = playlist.first?.uppercased()
let lastArtist = playlist.last?.uppercased()
print("First artist: \(firstArtist ?? "No artist") :: Last artist: \(lastArtist ?? "No artist")")


// MARK: Optional try
enum PasswordError: Error {
    case tooShort, obvious
}

func validatePassword(_ password: String) throws -> Bool {
    if password.count <= 3 {
        throw PasswordError.tooShort
    }
    
    if password == "Qwerty123" {
        throw PasswordError.obvious
    }
    
    return true
}

if let result = try? validatePassword("ASD12312312312321") {
    print("Result was: \(result)")
} else {
    print("There was an error.")
}

try! validatePassword("Qwerty123x")
print("OK!")


// MARK: Failable initializers
struct Developer {
    let id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

let dev = Developer(id: "123456789")

if let unwrappedDev = dev {
    print("Created DEV with ID = \(unwrappedDev.id)")
} else {
    print("There was a problem")
}


// MARK: Typecasting
class Animal {}

class Fish: Animal {}

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
