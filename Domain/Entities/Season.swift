//
//  Season.swift
//  Domain
//
//  Created by Sumra Aarif on 2020/08/07.
//  Copyright © 2020 Sumra Aarif. All rights reserved.
//

import Foundation

public struct Season: Codable {
    // Required
    public let id: Int
    public let name: String
    
    // Optionals
    public var overview: String? = nil
    public var posterPath: String? = nil
}

extension Season: Equatable {
    public static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.id == rhs.id // For now id comparision is enough
    }
}
