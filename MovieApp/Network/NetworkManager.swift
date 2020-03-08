//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Akan Akysh on 3/7/20.
//  Copyright © 2020 Akysh Akan. All rights reserved.
//

import Moya
protocol Networkable {
    static var provider: MoyaProvider<ApiManager> { get }
    static func getTopRatedMovies(completion: @escaping ([Movie])->())
}

struct NetworkManager: Networkable {
    static var provider = MoyaProvider<ApiManager>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    static func getTopRatedMovies(completion: @escaping ([Movie]) -> ()) {
        provider.request(.getTopRatedMovies) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(MovieResponse.self, from: response.data)
                    completion(results.results)
                } catch let error as NSError {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    

}
