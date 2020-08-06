//
//  Person.swift
//  Domain
//
//  Created by Sumra Aarif on 2020/08/06.
//  Copyright © 2020 Sumra Aarif. All rights reserved.
//
import Foundation

public struct Person: Codable {
    // Required
    public let id: Int
    public let name: String
    
    // Optionals
    public var gender: Int? = nil
    public var profilePath: String? = nil
}

extension Person: Equatable {
    public static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id // For now id comparision is enough
    }
}
