//
//  Resource.swift
//  Platform
//
//  Created by Sumra Aarif on 2019/12/05.
//  Copyright © 2019 Sumra Aarif. All rights reserved.
//

import Foundation

public protocol Creatable {}
public protocol Readable {}
public protocol Updatable {}
public protocol Deletable {}

public protocol Searchable {}
public protocol Ordering {
    associatedtype Option: RawRepresentable
}

public protocol ResourceType {
    associatedtype Model: Codable
//    associatedtype Option
    static var name: String { get }
}

public extension ResourceType where Self: Searchable {
    
    static func searchEndpoint(with query: String) -> Endpoint {
//        precondition(Self.self is Readable, "The resource must be readable")
        return Endpoint(
            path: "/3/search/\(Self.name)",
            queryItems: [
                URLQueryItem(name: "query", value: "\(query)")
            ]
        )
    }
}

extension ResourceType where Self: Ordering {

    func order(by option: Option) -> Endpoint {
        precondition(Self.self is Readable, "The resource must be readable")
        return Endpoint(
            path: "\(Self.name)/\(option)/",
            queryItems: [
//                URLQueryItem(name: "query", value: "\(option.rawValue)")
            ]
        )
    }
}

