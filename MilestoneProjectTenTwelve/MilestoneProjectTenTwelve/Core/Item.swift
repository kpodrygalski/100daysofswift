//
//  Item.swift
//  MilestoneProjectTenTwelve
//
//  Created by Konrad Podrygalski on 09/08/2023.
//

import UIKit

class Item: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }

}
