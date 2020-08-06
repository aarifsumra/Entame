//
//  Endpoint.swift
//  Platform
//
//  Created by Sumra Aarif on 2019/12/05.
//  Copyright © 2019 Sumra Aarif. All rights reserved.
//

import Foundation

public struct Endpoint {
    let path: String
    private(set) var queryItems: [URLQueryItem]
}

public extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = Server.scheme
        components.host = Server.hostname
        components.path = path
        components.queryItems = Server.defaultParams.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
            + queryItems
        return components.url
    }
}

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
