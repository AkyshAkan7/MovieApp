//
//  Movie.swift
//  MovieApp
//
//  Created by Akan Akysh on 3/7/20.
//  Copyright © 2020 Akysh Akan. All rights reserved.
//

import Foundation

struct Movie {
    //required
    var id: Int
    var title: String
    
    //optional
    var popularity: Double?
    var voteCount: Int?
    var overview: String?
    var releaseDate: Date?
    var averageVote: Double?
    var posterPath: String?
    var backdropPath: String?
    var genreIds: [Int]?
    var isVideo: Bool?
    var isAdult: Bool?
    
}

extension Movie: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case popularity
        case voteCount = "vote_count"
        case overview
        case releaseDate = "release_date"
        case averageVote = "vote_average"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case isVideo = "video"
        case isAdult = "adult"
    }
}
