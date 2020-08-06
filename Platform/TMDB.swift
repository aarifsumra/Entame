//
//  TMDB.swift
//  Platform
//
//  Created by Sumra Aarif on 2019/11/26.
//  Copyright © 2019 Sumra Aarif. All rights reserved.
//

import Foundation
import Moya

// MARK: Privates
private let apiURLString = "https://api.themoviedb.org/3"
private let defaultParams: [String : Any] = [
    "api_key": "***REMOVED***",
    "language": "en-US",
    "include_adult": false
]

// MARK: API Enum
enum TMDB {
    case movie(id: Int)
    case searchMovie(query: String, page: Int)
    case popularMovie(page: Int)
}

// MARK: Conform Target Type
extension TMDB {
    var baseURL: URL {
        guard let url = URL(string: apiURLString) else {
            fatalError("Invalid API URL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .movie(let id):
            return "/movie/\(id)"
        case .searchMovie:
            return "/search/movie"
        case .popularMovie:
            return "/movie/popular"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        var params = defaultParams
        switch self {
        case .movie:
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default
            )
        case .searchMovie(let query, let page):
            params["query"] = query
            params["page"] = page
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default
            )
        case .popularMovie(let page):
            params["page"] = page
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default
            )
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
