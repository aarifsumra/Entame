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
        components.queryItems = [defaultQueryItems, queryItems].reduce([], +)
        return components.url
    }
    
    var defaultQueryItems: [URLQueryItem] {
        return Server.defaultParams.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
    }
}
