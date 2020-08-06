//
//  Server.swift
//  Platform
//
//  Created by Sumra Aarif on 2020/08/06.
//  Copyright © 2020 Sumra Aarif. All rights reserved.
//

enum Server {
    static let scheme = "https"
    static let hostname = "api.themoviedb.org"
    static let defaultParams: [String : String] = [
        "api_key": "***REMOVED***",
        "language": "en-US",
        "include_adult": "false"
    ]
}

enum Method: String {
    case get, post, put, head, delete, patch, options
    var value: String {
        return self.rawValue.capitalized
    }
}

struct ListData<T: Decodable>: Decodable {
    let totalPages: Int
    let results: [T]
}
