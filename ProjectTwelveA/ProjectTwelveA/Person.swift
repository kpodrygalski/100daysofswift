//
//  Person.swift
//  ProjectTwelveA
//
//  Created by Konrad Podrygalski on 07/08/2023.
//

import UIKit

class Person: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }
    
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Read out from disk
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        image = aDecoder.decodeObject(forKey: "image") as? String ?? ""
    }
    
    func encode(with aCoder: NSCoder) {
        // Write to disk
        aCoder.encode(name, forKey: "name")
        aCoder.encode(image, forKey: "image")
    }
    
    
}
