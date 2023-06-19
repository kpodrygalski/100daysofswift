import UIKit

// 100DaysOfSwift - Day 15 - Swift review, day three

// MARK: Properties & Static properties and methods
struct MobileDevice {
    let name: String
    let model: String
    let bootInSafeMode: Bool?
    static let firmware: String = "v16.5"
    
    init(name: String, model: String, bootInSafeMode: Bool? = nil) {
        self.name = name
        self.model = model
        self.bootInSafeMode = bootInSafeMode
    }
    
    func boot() -> String {
        guard let bootInSafeMode else { return "LOG: [Booting up device: \(name).\(model)] :: BootMode - NORMAL - [Firmware: \(Self.firmware)]" }
        return "LOG: [Booting up device: \(name).\(model)] :: BootMode - SafeMode - [Firmware: \(Self.firmware)]"
    }
    
    static func getInfoAboutFirmware() {
        print("Device firmware: \(firmware)")
    }
}

let device = MobileDevice(name: "iPhone", model: "SE2022", bootInSafeMode: true)
print(device.boot())
MobileDevice.getInfoAboutFirmware()


// MARK: Access control
struct Address {
    private let city: String
    private let street: String
    private let houseNumber: String
    private let apartmentNumber: String?
    private let postalCode: String
    
    private var fullAddress: String {
        return "City: \(city), Street: \(street), HouseNumber: \(houseNumber), ApartmentNumber: \(apartmentNumber ?? "-"), PostalCode: \(postalCode)"
    }
    
    init(city: String, street: String, houseNumber: String, apartmentNumber: String?, postalCode: String) {
        self.city = city
        self.street = street
        self.houseNumber = houseNumber
        self.apartmentNumber = apartmentNumber
        self.postalCode = postalCode
        
        print(fullAddress)
    }
    
    func getCity() -> String {
        return city
    }
}

var address = Address(city: "SomeCity", street: "SomeStreet", houseNumber: "66", apartmentNumber: nil, postalCode: "00-000")
print(address.getCity())


// MARK: Polymorphism and typecasting
class Quest {
    let id: Int = Int.random(in: 1...1000)
    let title: String
    let description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    func acceptQuest() -> String {
        return "Quest \(title) was accepted."
    }
}

class BeginnerQuest: Quest {
    let mobsToKill: Int
    
    init(title: String, description: String, mobsToKill: Int) {
        self.mobsToKill = mobsToKill
        super.init(title: title, description: description)
    }
    
    override func acceptQuest() -> String {
        return "Quest \(title) was accepted. Mobs to kill: \(mobsToKill)"
    }
}

class AdvancedQuest: BeginnerQuest {
    let requiredLevel: Int
    
    init(title: String, description: String, mobsToKill: Int, requiredLevel: Int) {
        self.requiredLevel = requiredLevel
        super.init(title: title, description: description, mobsToKill: mobsToKill)
    }
    
    override func acceptQuest() -> String {
        return "Quest \(title) require \(requiredLevel) level. If you are ready accept quest. Mobs to kill \(mobsToKill)"
    }
}

let moveQuest = Quest(title: "Move character", description: "Use WSAD to move your character.")
let beginnerQuest = BeginnerQuest(title: "Kill training mobs", description: "Move to train place and kill all training mobs.", mobsToKill: 10)
let advancedQuest = AdvancedQuest(title: "Kill training boss", description: "Pick up all items from training mobs. After that your gear level will be increased.", mobsToKill: 1, requiredLevel: 4)
let quests: [Quest] = [moveQuest, beginnerQuest, advancedQuest]

for quest in quests {
    let beginnerQuest = quest as? BeginnerQuest
    let advancedQuest = quest as? AdvancedQuest
    
    if let beginnerQuest = quest as? BeginnerQuest {
        print("BeginnerQuest: \(beginnerQuest.acceptQuest())")
    } else if let advancedQuest = quest as? AdvancedQuest {
        print("AdvancedQuest: \(advancedQuest.acceptQuest())")
    }
}

// MARK: Closures
let sendMessage = { (message: String) in
    print("Message to sent: \(message)")
}
sendMessage("Hi, how are you?")

let compareNumbers = { (numberOne: Int, numberTwo: Int) -> Bool in
    numberOne > numberTwo ? true : false
}
compareNumbers(5, 10)
