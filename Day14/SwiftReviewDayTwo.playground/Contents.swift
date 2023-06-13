import UIKit

// 100DaysOfSwift - Day 14 - Swift review, day two

// MARK: Functions
func sendGreetingsToSwiftCommunity(from person: String, say message: String) {
    print("Hello from \(person), Swift community. \(message)")
}

sendGreetingsToSwiftCommunity(from: "Konrad", say: "Swift is awesome.")

// MARK: Enumeration
enum ProfileType {
    case github, twitter
}

enum ProfileError: Error {
    case unknownUsername, userNotExists
}

// MARK: Optionals
func getGithubProfile(for username: String) throws -> String? {
    if username != "kpodrygalski" {
        throw ProfileError.unknownUsername
    }
    return "https://github.com/\(username)"
}

func getTwitterProfile(for username: String) throws -> String? {
    if username != "nsrivss" {
        throw ProfileError.userNotExists
    }
    return "https://twitter.com/\(username)"
}

func showSocialMedia(for profileType: ProfileType) throws -> String {
    guard let gitHubProfile = try getGithubProfile(for: "kpodrygalski") else { return "Failed to fetch GitHub profile." }
    guard let twitterProfile = try getTwitterProfile(for: "nsrivss") else { return "Failed to fetch Twitter profile."}
    
    switch profileType {
    case .github:
        return "GitHub: \(gitHubProfile)"
    case .twitter:
        return "Twitter: \(twitterProfile)"
    }
}

do {
    let profile = try showSocialMedia(for: .github)
    print(profile)
} catch {
    print("Error: \(error)")
}


// MARK: Optional chaining
let fruits: [String] = ["Apple", "Peach", "Banana", "Raspberry", "Grapefruit", "Orange", "Strawberry", "Watermelon", "Cherry"]

print("Uppercased first fruit name: \(fruits.first?.uppercased() ?? "First index is empty.")")
print("Uppercased last fruit name: \(fruits.last?.uppercased() ?? "Last index is empty.")")

if let firstFruit = fruits.first {
    print("First fruit: \(firstFruit.uppercased())")
}

if let lastFruit = fruits.last {
    print("Last fruit: \(lastFruit.uppercased())")
}

// MARK: Structs
struct UserProfile {
    let id: String = UUID().uuidString
    let name: String
    let age: Int
    let dream: String
    let favouriteFruits: [String]?
    var animals: [String] = []
    
    init(name: String, age: Int, dream: String, favouriteFruits: [String]? = nil) {
        self.name = name
        self.age = age
        self.dream = dream
        self.favouriteFruits = favouriteFruits
    }
    
    func introduce() -> String {
        guard let favouriteFruits else { return "I can't introduce this object. Favourite fruits was not given." }
        return "Hello, my name is: \(name). I'm \(age) old. My dream is \(dream). My favourite fruits are: \(favouriteFruits)"
    }
    
    mutating func addAnimal(name: String) {
        animals.append(name.uppercased())
    }
    
    func getAnimals() {
        print("My animals: \(animals)")
    }
}

var myProfile = UserProfile(name: "Konrad", age: 27, dream: "Become an Junior iOS Developer.", favouriteFruits: fruits)
print(myProfile.introduce())
myProfile.addAnimal(name: "Zoey")
myProfile.getAnimals()

let otherProfile = UserProfile(name: "Jack", age: 29, dream: "Be better in programming.", favouriteFruits: ["Cherries"])
print(otherProfile.introduce())
otherProfile.getAnimals()


// MARK: Classes
class BaseCoffeeMachine {
    let name: String
    let model: String
    
    init(name: String, model: String) {
        self.name = name
        self.model = model
    }
    
    func makeCoffee() {
        print("Making standard coffee.")
    }
}

final class BetterCoffeeMachine: BaseCoffeeMachine {
    let useMilk: Bool
    
    init(name: String, model: String, useMilk: Bool) {
        self.useMilk = useMilk
        super.init(name: name, model: model)
    }
    
    override func makeCoffee() {
        print("Making coffee. With milk? - \(useMilk ? "Yes" : "No")")
    }
}

// MARK: ERROR - Inheritance from final class is not allowed!
//class UltimateCoffeeMachine: BetterCoffeeMachine {
//
//}

let coffeeMachineOne = BaseCoffeeMachine(name: "MachineOne", model: "GV013")
coffeeMachineOne.makeCoffee()

let betterCoffeeMachine = BetterCoffeeMachine(name: "BetterMachine", model: "OOP2023", useMilk: true)
betterCoffeeMachine.makeCoffee()
