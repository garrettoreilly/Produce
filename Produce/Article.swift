//
//  Article.swift
//  Produce
//
//  Created by Garrett Oreilly on 2018-06-21.
//  Copyright © 2018 Garrett Oreilly. All rights reserved.
//

import Foundation

struct Response: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]

    static func fetchArticle(completion: @escaping ([Article]?) -> Void) {
        let baseURL = URL(string: "https://newsapi.org/v2/top-headlines?")!

        let query: [String: String] = [
            "country": "us",
            "apiKey": AccessKeys.newsAPI
        ]

        guard let url = baseURL.withQueries(query) else {
            completion(nil)
            print("Unable to build URL with supplied queries.")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data, let response = try? decoder.decode(Response.self, from: data) {
                completion(response.articles)
            } else {
                print("Either no data was returned or data was not serialized.")
                completion(nil)
            }
        }
        task.resume()
    }
}

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: URL?
    let urlToImage: URL?
    let publishedAt: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}

