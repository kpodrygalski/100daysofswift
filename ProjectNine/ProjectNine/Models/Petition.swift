//
//  Petition.swift
//  ProjectNine
//
//  Created by Konrad Podrygalski on 24/07/2023.
//

import Foundation

struct Petition: Codable {
    let title: String
    let body: String
    let signatureCount: Int
}
