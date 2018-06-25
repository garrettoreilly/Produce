//
//  Source.swift
//  Produce
//
//  Created by Garrett Oreilly on 2018-06-25.
//  Copyright © 2018 Garrett Oreilly. All rights reserved.
//

import Foundation

struct Source: Codable {
    let id: String?
    let name: String?
    let description: String?
    let url: String?
    let category: String?
    let language: String?
    let country: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case url
        case category
        case language
        case country
    }
}
