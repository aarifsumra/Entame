//
//  MovieResource.swift
//  Platform
//
//  Created by Sumra Aarif on 2020/07/30.
//  Copyright © 2020 Sumra Aarif. All rights reserved.
//

import Domain

public enum MovieResource: ResourceType, Readable, Searchable {
    public typealias Model = Domain.Movie
    public static let name = "movie"

//    public typealias Option = Filtering
    
//    public enum Filtering: String {
//        case latest
//        case popular
//    }
}
