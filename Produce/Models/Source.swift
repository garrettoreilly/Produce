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
    
    static func fetchSources(completion: @escaping ([Source]?) -> Void) {
        let baseURL = URL(string: "https://newsapi.org/v2/sources?")
        
        let query = [
            "apiKey": AccessKeys.newsAPI
        ]
        
        guard let url = baseURL?.withQueries(query) else {
            completion(nil)
            print("Unable to build URL with supplied queries.")
            return
        }
        
        let decoder = JSONDecoder()
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let response = try? decoder.decode(SourceResponse.self, from: data) {
                completion(response.sources)
            } else {
                print("Either no data was returned or the data was not serialized.")
                completion(nil)
            }
        }
        task.resume()
    }
}

struct SourceResponse: Codable {
    let status: String?
    let sources: [Source]
}
