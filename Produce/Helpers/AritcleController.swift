//
//  AritcleController.swift
//  Produce
//
//  Created by Garrett Oreilly on 2018-06-26.
//  Copyright © 2018 Garrett Oreilly. All rights reserved.
//

import Foundation

class ArticleController {
    
    var delegate: ArticleControllerDelegate?
    
    func fetchArticles(with query: [String: String]) {
        let baseURL = URL(string: "https://newsapi.org/v2/top-headlines?")!
        
        guard let url = baseURL.withQueries(query) else {
            delegate?.updateArticles(with: nil)
            print("Unable to build URL with supplied queries.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data, let response = try? decoder.decode(ArticleResponse.self, from: data) {
                DispatchQueue.main.sync {
                    self.delegate?.updateArticles(with: response.articles)
                }
            } else {
                print("Either no data was returned or data was not serialized.")
                self.delegate?.updateArticles(with: nil)
            }
        }
        task.resume()
    }
}
