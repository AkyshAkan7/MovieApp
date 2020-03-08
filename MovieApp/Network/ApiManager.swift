//
//  ApiManager.swift
//  MovieApp
//
//  Created by Akan Akysh on 3/7/20.
//  Copyright © 2020 Akysh Akan. All rights reserved.
//

import Moya

private let api_url = URL(string: "https://api.themoviedb.org/3")
private let APIKey = "1e83b2d3e2bb3ef86c16c5b101e8e0d6"

enum ApiManager {
    case getTopRatedMovies
}

extension ApiManager: TargetType {
    var baseURL: URL {
        guard let url = api_url else { fatalError("base url could not be configured")}
        return url
    }
    
    var path: String {
        switch self {
        case .getTopRatedMovies:
            return "/movie/top_rated"
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
        case .getTopRatedMovies:
            return .requestParameters(parameters: ["api_key": APIKey], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}

