//
//  ArticleControllerDelegate.swift
//  Produce
//
//  Created by Garrett Oreilly on 2018-06-26.
//  Copyright © 2018 Garrett Oreilly. All rights reserved.
//

import Foundation

protocol ArticleControllerDelegate {
    func updateArticles(with articles: [Article]?)
}
