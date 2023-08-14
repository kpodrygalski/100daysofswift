//
//  StormImage.swift
//  ProjectOne
//
//  Created by Konrad Podrygalski on 08/08/2023.
//

import UIKit

class StormImage: NSObject, Codable, Comparable {
    static func < (lhs: StormImage, rhs: StormImage) -> Bool {
        return lhs.imageName < rhs.imageName
    }
    
    var imageName: String
    var viewCount: Int
    
    init(imageName: String, viewCount: Int) {
        self.imageName = imageName
        self.viewCount = viewCount
    }
}
