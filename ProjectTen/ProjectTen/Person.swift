//
//  Person.swift
//  ProjectTen
//
//  Created by Konrad Podrygalski on 31/07/2023.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
