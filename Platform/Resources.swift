//
//  Resources.swift
//  Platform
//
//  Created by Sumra Aarif on 2020/07/30.
//  Copyright © 2020 Sumra Aarif. All rights reserved.
//

import Domain

public enum Resources {

    public enum Movie: ResourceType, Readable, Searchable {
        public typealias Model = Domain.Movie
        public static let name = "movie"
    }

    public enum TV: ResourceType, Readable, Searchable {
        public typealias Model = Domain.TV
        public static let name = "tv"
    }

    public enum Person: ResourceType, Readable, Searchable {
        public typealias Model = Domain.Person
        public static let name = "person"
    }
}
