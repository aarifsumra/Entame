//
//  MoviesAPI.swift
//  Platform
//
//  Created by Sumra Aarif on 2019/11/26.
//  Copyright © 2019 Sumra Aarif. All rights reserved.
//

import Domain

enum APIError: Error {
    case badResource
    case badEndpoint
}

struct ListData<T: Decodable>: Decodable {
    let totalPages: Int
    let results: [T]
}

public class API<T: ResourceType> {
    private let network: Networking
    
    public init(network: Networking) {
        self.network = network
    }
}

public extension API where T: ResourceType & Searchable {

    func search(with query: String, resultHandler:@escaping ([T.Model]) -> Void) throws {

        guard let searchUrl = T.searchEndpoint(with: query).url else {
            throw APIError.badEndpoint
        }

        let request = URLRequest(url: searchUrl)
        network.submit(request) { data in
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let listResponse = try decoder.decode(ListData<T.Model>.self, from: data)
                resultHandler(listResponse.results)
            } catch let err {
                print(err.localizedDescription)
            }
        }
    }
}
