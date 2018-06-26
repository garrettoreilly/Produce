//
//  Article.swift
//  Produce
//
//  Created by Garrett Oreilly on 2018-06-21.
//  Copyright © 2018 Garrett Oreilly. All rights reserved.
//

import Foundation
import UIKit

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let datePublished: String?
    
    var image: UIImage?
    
    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case datePublished = "publishedAt"
    }
}


struct ArticleResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]
}

