//
//  TV.swift
//  Domain
//
//  Created by Sumra Aarif on 2020/08/06.
//  Copyright © 2020 Sumra Aarif. All rights reserved.
//

import Foundation

public struct TV: Codable {
    // Required
    public let id: Int
    public let name: String
    
    // Optionals
    public var overview: String? = nil
    public var posterPath: String? = nil
    public var firstAirDate: String? = nil
    public var status: String? = nil
}

extension TV: Equatable {
    public static func ==(lhs: TV, rhs: TV) -> Bool {
        return lhs.id == rhs.id // For now id comparision is enough
    }
}
