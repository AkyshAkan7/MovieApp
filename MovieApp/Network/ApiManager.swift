//
//  ApiManager.swift
//  MovieApp
//
//  Created by Akan Akysh on 3/7/20.
//  Copyright © 2020 Akysh Akan. All rights reserved.
//

import Moya

private let api_url = URL(string: "https://api.themoviedb.org/3/movie")
private let APIKey = "1e83b2d3e2bb3ef86c16c5b101e8e0d6"

enum ApiManager {
    case topRatedMovies(page: Int)
    case upcomingMovies(page: Int)
    case popularMovies(page: Int)
    case latestMovie
}

extension ApiManager: TargetType {
    var baseURL: URL {
        guard let url = api_url else { fatalError("base url could not be configured")}
        return url
    }
    
    var path: String {
        switch self {
        case .topRatedMovies:
            return "/top_rated"
        case .upcomingMovies:
            return "/upcoming"
        case .popularMovies:
            return "/popular"
        case .latestMovie:
            return "/latest"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .topRatedMovies(let page), .upcomingMovies(let page), .popularMovies(let page):
            return .requestParameters(parameters: ["page": page, "api_key": APIKey], encoding: URLEncoding.default)
        case .latestMovie:
            return .requestParameters(parameters: ["api_key": APIKey], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}

