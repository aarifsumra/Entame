//
//  ResourceType.swift
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

public protocol ResourceType: Readable {
    associatedtype Model: Codable
//    associatedtype Option
    static var name: String { get }
}

public protocol NestedResourceType: ResourceType {
    associatedtype Parent: ResourceType
}

public extension ResourceType {
    static func detailEndpoint(with id: Int) -> Endpoint {
        return Endpoint(
            path: "/3/\(Self.name)/\(id)",
            queryItems: []
        )
    }
}

public extension NestedResourceType {
    static var parent: Parent.Type {
        return Parent.self
    }
}

public extension NestedResourceType {
    static func detailEndpoint(with id: Int, parentEndpoint: Endpoint) -> Endpoint {
        return Endpoint(
            path: parentEndpoint.path + "/\(Self.name)/\(id)",
            queryItems: [] + parentEndpoint.queryItems
        )
    }
}

public extension ResourceType where Self: Searchable {
    static func searchEndpoint(with query: String) -> Endpoint {
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
        return Endpoint(
            path: "\(Self.name)/\(option)/",
            queryItems: [
//                URLQueryItem(name: "query", value: "\(option.rawValue)")
            ]
        )
    }
}

