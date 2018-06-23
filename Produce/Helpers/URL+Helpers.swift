//
//  URL+Helpers.swift
//  Produce
//
//  Created by Garrett Oreilly on 2018-06-21.
//  Copyright © 2018 Garrett Oreilly. All rights reserved.
//

import Foundation
import UIKit


extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
