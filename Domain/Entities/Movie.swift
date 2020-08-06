//
//  Movie.swift
//  Domain
//
//  Created by Sumra Aarif on 2019/11/25.
//  Copyright © 2019 Sumra Aarif. All rights reserved.
//

import Foundation

public struct Movie: Codable {
    // Required
    public let id: Int
    public let title: String
    
    // Optionals
    public var overview: String?
    public var posterPath: String?
    public var releaseDate: String?
    public var status: String?
    
    public init(id: Int, title: String, overview: String? = nil, posterPath: String? = nil, releaseDate: String? = nil, status: String? = nil) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.status = status
    }
}


extension Movie: Equatable {
    public static func ==(lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id // For now id comparision is enough
    }
}
