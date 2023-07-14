//
//  Petition.swift
//  ProjectSeven
//
//  Created by Konrad Podrygalski on 14/07/2023.
//

import Foundation

struct Petition: Codable {
    let title: String
    let body: String
    let signatureCount: Int
}
