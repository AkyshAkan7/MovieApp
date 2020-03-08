//
//  Page.swift
//  MovieApp
//
//  Created by Akan Akysh on 3/8/20.
//  Copyright © 2020 Akysh Akan. All rights reserved.
//

import Foundation

struct MovieResponse {
    var page: Int
    var totalPages: Int
    var totalResults: Int
    var results: [Movie]
}

extension MovieResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results
    }
}
