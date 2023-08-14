//
//  Person.swift
//  ProjectTwelveB
//
//  Created by Konrad Podrygalski on 07/08/2023.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
